<?php
namespace App\Domain\WebScraper\Shared;

use Illuminate\Support\Facades\Log;
use App\Models\News;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

class NewsImageDownloader
{
    public function handle(News $news): void
    {
        if (!$news->image_remote) {
            return;
        }

        try {
            $imageContent = Http::get($news->image_remote)->body();
            if (!$imageContent) {
                throw new \Exception("Failed to download image from {$news->image_remote}");
            }

            $extension = pathinfo($news->image_remote, PATHINFO_EXTENSION);
            $savePath = "news-images/{$news->id}.{$extension}";
            Storage::disk('public')->put($savePath, $imageContent);

            $news->update(['image_local' => Storage::url($savePath)]);
        } catch (\Exception $e) {
            Log::error("Image download error: " . $e->getMessage());
        }
    }
}
