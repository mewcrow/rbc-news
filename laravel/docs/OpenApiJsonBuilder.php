<?php

namespace Docs;

use Symfony\Component\Yaml\Yaml;

class OpenApiJsonBuilder
{
    public function build(): array
    {
        $base = Yaml::parseFile(base_path('docs/openapi.yaml'));

        $paths = [];
        foreach (glob(base_path('docs/paths/*.yaml')) as $file) {
            $data = Yaml::parseFile($file);
            $paths = array_merge($paths, $data);
        }
        $base['paths'] = $paths;

        $base['components']['schemas'] = Yaml::parseFile(base_path('docs/components/schemas.yaml'));
        $base['components']['securitySchemes'] = Yaml::parseFile(base_path('docs/components/securitySchemes.yaml'));

        return $base;
    }
}
