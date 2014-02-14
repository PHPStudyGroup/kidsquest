<?php

namespace SongLyrics\Factory;


use SongLyrics\ViewHelper\Lyricizer;
use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;

class LyricizerFactory implements FactoryInterface
{
    /**
     * Create Lyricizer
     *
     * @param ServiceLocatorInterface $serviceLocator
     * @return Lyricizer
     */
    public function createService(ServiceLocatorInterface $serviceLocator)
    {
        $viewHelper = new Lyricizer();

        $viewHelper->setRandomLineService(
            $serviceLocator->getServiceLocator()->get('AllYourBaseLyrics')
        );

        return $viewHelper;
    }

} 