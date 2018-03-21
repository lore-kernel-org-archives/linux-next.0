From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 21 Mar 2018 11:15:16 +0530
Message-ID: <3bc6e9ca-b1d9-3458-6399-758be07fd7f3@amd.com>
References: <20180321133040.6754c372@canb.auug.org.au>
 <20180321024556.GX2186@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321024556.GX2186@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Akshu Agrawal <akshu.agrawal@amd.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org



On Wednesday 21 March 2018 08:15 AM, Mark Brown wrote:
> On Wed, Mar 21, 2018 at 01:30:40PM +1100, Stephen Rothwell wrote:
>
>> Caused by commit
>>    363fe37948e2 ("ASoC: amd: dma driver changes for BT I2S controller instance")
>> I have used the sound-asoc tree from next-20180320 for today.
> Dropped.


There is a patch dependency .
Below patch not merged yet. We submitted for upstream review.
[PATCH V2] ASoC: dwc: I2S Controller instance param added
