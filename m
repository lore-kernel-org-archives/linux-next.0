From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: Fixes tags need some work in the sound-asoc tree
Date: Tue, 28 May 2019 17:22:40 -0500
Message-ID: <44bbb3f1-5674-6431-5818-d8b5cca708dd@linux.intel.com>
References: <20190529075614.150b1877@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529075614.150b1877@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>, Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, Keyon Jie <yang.jie@linux.intel.com>, Libin Yang <libin.yang@intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On 5/28/19 4:56 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    be1b577d0178 ("ASoC: SOF: Intel: hda: fix the hda init chip")
> 
> Fixes tag
> 
>    Fixes: 8a300c8fb17 ("ASoC: SOF: Intel: Add HDA controller for Intel DSP")

Sorry about that, not sure how I managed to add an off-by-one in all 
these tags. Checkpatch.pl --strict did not report any issues, something 
must be broken either in my setup or the script.
Not sure how I can fix this now?
