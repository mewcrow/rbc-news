<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class NewsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'slug' => $this->slug,
            'title' => $this->title,
            'image' => $this->getImageUrl(),
            'text' => $this->text,
            'rating' => $this->rating,
            'created_at' => $this->created_at->toIso8601String(),
        ];
    }

    private function getImageUrl(): ?string
    {
        return $this->image_local ? asset($this->image_local) : $this->image_remote;
    }
}
