From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Thu, 22 Mar 2018 11:24:43 +0530
Message-ID: <3d47f2cb-0a73-98a7-bb3a-f40baf00123b@amd.com>
References: <20180321133040.6754c372@canb.auug.org.au>
 <20180321024556.GX2186@sirena.org.uk>
 <3bc6e9ca-b1d9-3458-6399-758be07fd7f3@amd.com>
 <20180322013817.GY2186@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180322013817.GY2186@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Akshu Agrawal <akshu.agrawal@amd.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org



On Thursday 22 March 2018 07:08 AM, Mark Brown wrote:
> On Wed, Mar 21, 2018 at 11:15:16AM +0530, Mukunda,Vijendar wrote:
>
>> There is a patch dependency .
>> Below patch not merged yet. We submitted for upstream review.
>> [PATCH V2] ASoC: dwc: I2S Controller instance param added
> You need to mention dependencies between patches when publishing and I
> don't seem to have a copy of that patch, according to the list archives
> Alex asked you to make some chnages to it.

    Changes suggested by Alex already implemented and posted .
    Current patch (https://patchwork.kernel.org/patch/10298281/ ) is
    dependent on below patch.

    https://patchwork.kernel.org/patch/10296597/

    We will publish patch dependencies while sending patches.
