From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Tue, 20 Nov 2018 03:56:15 +0300
Message-ID: <108dd586-379a-21ba-6c44-ea895034bbca@gmail.com>
References: <20181120114904.10ef0573@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120114904.10ef0573@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 20.11.2018 3:49, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the regulator tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "regulator_lock" [drivers/regulator/wm8350-regulator.ko] undefined!
> ERROR: "regulator_unlock" [drivers/regulator/wm8350-regulator.ko] undefined!
> ERROR: "regulator_unlock" [drivers/regulator/da9210-regulator.ko] undefined!
> ERROR: "regulator_lock" [drivers/regulator/da9210-regulator.ko] undefined!
> 
> Caused by commit
> 
>   f8702f9e4aa7 ("regulator: core: Use ww_mutex for regulators locking")
> 
> I have used the regulator tree from next-20181119 for today.
> 

My bad, forgot to export these functions. That's the same issue that was reporter by the build robot earlier. Will send the fix, sorry for the inconvenience.
