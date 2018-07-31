From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: next/master boot: 179 boots: 11 failed, 167 passed with 1
 offline (next-20180731)
Date: Tue, 31 Jul 2018 21:50:37 +0200
Message-ID: <20180731195037.GA6737@centauri.lan>
References: <5b607cc4.1c69fb81.6c1d6.6534@mx.google.com>
 <20180731161114.GI5719@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180731161114.GI5719@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linux-arm-msm@vger.kernel.org, David Brown <david.brown@linaro.org>, linux-next@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Tue, Jul 31, 2018 at 05:11:14PM +0100, Mark Brown wrote:
> On Tue, Jul 31, 2018 at 08:14:12AM -0700, kernelci.org bot wrote:
> 
> Today's -next fails to boot on db820c:
> 
> > arm64:
> 
> >     defconfig:
> >         apq8096-db820c:
> >             lab-bjorn: new failure (last pass: next-20180730)
> 
> There's nothing immediately obvious as the boot failure cause in the
> logs, the last output is a failure to load the ath10k_pci firmware:
> 
> 04:02:53.750283  [    4.503980] ath10k_pci 0000:01:00.0: Failed to find firmware-N.bin (N between 2 and 6) from ath10k/QCA6174/hw3.0: -2
> 04:02:53.756384  [    4.504010] ath10k_pci 0000:01:00.0: could not fetch firmware files (-2)
> 04:02:53.760522  [    4.513736] ath10k_pci 0000:01:00.0: could not probe fw (-2)
> 
> but I'm not sure that's the actual cause.  More details, including the
> full boot log, here:
> 
>    https://kernelci.org/boot/id/5b6042b559b514136096babf/

I tried booting today's -next on db820c, using arm64 defconfig,
and it booted correctly:

I also tried removing the ath10k firmware from my initrd, but it still booted
correctly.

# cat /proc/version
Linux version 4.18.0-rc7-next-20180731-00001-g47055e3ba913 (nks@centauri) (gcc version 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #9 SMP PREEMPT Tue Jul 31 21:34:43 CEST 2018

I guess it could be a bug that does not trigger on every boot,
or it could be a problem in the kernelci infrastructure.


Kind regards,
Niklas
