<?php

namespace SongLyricsTest\Service;

use SongLyrics\Service\RandomLine;

class RandomLineTest extends \PHPUnit_Framework_TestCase
{
    /** @var RandomLine */
    protected $service;

    public function setUp()
    {
        $this->service = new RandomLine();
    }

    /**
     * Ensures that we get back a string
     *
     * @test
     */
    public function returnValueIsAString()
    {
        $data = ['This is my test string' . uniqid()];
        $this->service->setData($data);

        $randomLine = $this->service->getRandomLine();
        $this->assertInternalType('string', $randomLine);
        $this->assertEquals($data[0], $randomLine);
    }
} 