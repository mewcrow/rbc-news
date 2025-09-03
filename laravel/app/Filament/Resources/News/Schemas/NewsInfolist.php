<?php

namespace App\Filament\Resources\News\Schemas;

use Filament\Infolists\Components\ImageEntry;
use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class NewsInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('pageLink.id'),
                TextEntry::make('slug'),
                TextEntry::make('title'),
                ImageEntry::make('image_remote'),
                ImageEntry::make('image_local'),
                TextEntry::make('rating')
                    ->numeric(),
                TextEntry::make('deleted_at')
                    ->dateTime(),
                TextEntry::make('created_at')
                    ->dateTime(),
                TextEntry::make('updated_at')
                    ->dateTime(),
            ]);
    }
}
