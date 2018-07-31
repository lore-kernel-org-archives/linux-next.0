From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: next/master boot: 171 boots: 6 failed, 162 passed with 3
 offline (next-20180724)
Date: Tue, 31 Jul 2018 23:35:09 +0200 (CEST)
Message-ID: <1380807549.9923.1533072909710@email.1und1.de>
References: <5b5757ee.1c69fb81.411a5.52e2@mx.google.com>
 <20180725161151.GA340@sirena.org.uk> <20180731155246.GG5719@sirena.org.uk>
 <bb89388b-db7e-a59f-6fd1-4e88b602054c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <bb89388b-db7e-a59f-6fd1-4e88b602054c@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Anholt <eric@anholt.net>, Kevin Hilman <khilman@kernel.org>, Robin Murphy <robin.murphy@arm.com>, clabbe@baylibre.com, Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org


> Robin Murphy <robin.murphy@arm.com> hat am 31. Juli 2018 um 19:00 geschrieben:
> 
> 
> On 31/07/18 16:52, Mark Brown wrote:
> > On Wed, Jul 25, 2018 at 05:11:51PM +0100, Mark Brown wrote:
> >> On Tue, Jul 24, 2018 at 09:46:38AM -0700, kernelci.org bot wrote:
> > 
> >> For a little while now the RPi B has been failing to boot using the
> >> bcm2835 defconfig in -next:
> > 
> > ...
> > 
> >> It's working fine on arm64, whatever's going on appears to be specific
> >> to this config (it's not getting booted with any other 32 bit configs).
> >> Full info and boot logs for one of the boards here:
> > 
> >>     https://kernelci.org/boot/id/5b58416759b514139596baae/
> > 
> >> it looks like it hangs somewhere shortly after or during initializing
> >> MMC so never makes it to the console, the tail of the failing logs looks
> >> like:
> > 
> > This went away for a day or two but it looks like it's back again I'm
> > afraid:
> 
> FWIW, it looks like that blip was due to me completely breaking DMA API 
> functionality for DT devices in next-20180727. Funny that that actually 
> "helped" in this case (unlike all the others...), but it definitely 
> reinforces Stefan's observation.
> 
> Robin.
> 

Sorry, still not much time this week. All i can say that next-20180731 is broken, but dma-mapping/for-next is not.
