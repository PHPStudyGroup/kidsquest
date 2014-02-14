<?php
namespace SongLyrics\ViewHelper;

use SongLyrics\Service\RandomLine;
use Zend\Form\View\Helper\AbstractHelper;

class Lyricizer extends AbstractHelper
{
    /** @var RandomLine */
    protected $randomLineService;

    public function __invoke()
    {
        return $this->getRandomLineService()->getRandomLine();
    }

    /**
     * Sets the randomLine value for the class
     *
     * @param \SongLyrics\Service\RandomLine $randomLine
     *
     * @return static
     */
    public function setRandomLineService($randomLine)
    {
        $this->randomLineService = $randomLine;
        return $this;
    }

    /**
     * @return \SongLyrics\Service\RandomLine
     */
    public function getRandomLineService()
    {
        return $this->randomLineService;
    }
} 