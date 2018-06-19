From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: next/master boot: 138 boots: 8 failed,
 112 passed with 18 offline (next-20180619)
Date: Tue, 19 Jun 2018 16:57:41 +0200
Message-ID: <7241956.9AMTTgrPoJ@diego>
References: <5b290c6d.1c69fb81.fc936.98ee@mx.google.com>
 <69c0adb9-b784-4f73-fcc9-ff1a01ce27c5@arm.com>
 <20180619144143.GE11230@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180619144143.GE11230-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-next.vger.kernel.org

> > On Tue, Jun 19, 2018 at 07:00:13AM -0700, kernelci.org bot wrote:
> > 
> > Today and yesterday's -next is failing to boot on rk3399-firefly in two
> > 
> > configs:
> >>     defconfig:
> >>         rk3399-firefly:
> >>             lab-baylibre-seattle: failing since 1 day (last pass:
> >>             next-20180615 - first fail: next-20180618)>>     
> >>     defconfig+CONFIG_RANDOMIZE_BASE=y:
> >>         rk3399-firefly:
> >>             lab-baylibre-seattle: failing since 1 day (last pass:
> >>             next-20180615 - first fail: next-20180618)> 
> > The log ends with:
> > 
> > [    2.629278] SWITCH_REG2: supplied by vcc3v3_sys
> > [    2.633030] fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1]
> > Detected! [    2.633723] fan53555-reg: supplied by vcc_sys
> > [    2.6353|] Internal error: undefined instruction: 0 [#1] PREEMPT SMP
> > 
> > which is rather entertaining.

> Am Dienstag, 19. Juni 2018, 16:41:43 CEST schrieb Mark Brown:
> On Tue, Jun 19, 2018 at 03:22:47PM +0100, Sudeep Holla wrote:
> > Based on the logs from successful boots, I see it's CPUFreq that gets
> > probed after fan53555-reg. I also see that it warns about unlisted OPPs
> > in the successful boots. I guess, the undefined instruction could occur
> > if there's issue with CPU DVFS(under voltage or frequency that's not
> > supported). I don't have much knowledge on the platform, I am just
> > guessing on the possible cause here.
> 
> Yeah, that was my guess - either an out of spec voltage/frequency was
> selected or the regulator isn't able to keep up with the voltage
> transition or a load spike and the power browns out.

I guess this is related to
	arm64: dts: rockchip: correct voltage selector Firefly-RK3399 [0]

which is in so far interesting as the patch seems to fix a similar issue
to the above with the opposite "fcs,suspend-voltage-selector" value.
And also claims to be in line with the vendor kernel.

>From looking at the schematics, we might have a discrepancy between the
fcs,suspend-voltage-selector and vsel input-pin leading to a gpio
[likely depending on what the bootloader set this pin up for].

I'll drop the patch for now and get in contact with the patch submitter.


Heiko

[0] https://patchwork.kernel.org/patch/10447075/
