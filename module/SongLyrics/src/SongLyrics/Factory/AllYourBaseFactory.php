<?php

namespace SongLyrics\Factory;


use SongLyrics\Service\RandomLine;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class AllYourBaseFactory implements FactoryInterface
{
    /**
     * Create service
     *
     * @param ServiceLocatorInterface $serviceLocator
     * @return mixed
     */
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        $service = new RandomLine();

        $data = file(__DIR__ . '/../../../data/lyrics.txt');
        $service->setData($data);

        return $service;
    }
}