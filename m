From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: build failure after merge of the pwm tree
Date: Sat, 12 Jan 2019 16:27:07 +0100
Message-ID: <20190112152707.64iubvg53ng4kvlt@pengutronix.de>
References: <20190112170117.0d4674fa@canb.auug.org.au>
 <20190112170859.2cee77d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190112170859.2cee77d0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thierry Reding <thierry.reding@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

Hello, 

On Sat, Jan 12, 2019 at 05:08:59PM +1100, Stephen Rothwell wrote:
> On Sat, 12 Jan 2019 17:01:17 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > [Reported by "kernelci.org bot" <bot@kernelci.org>]
> 
> [Also reported by Mark Brown <broonie@kernel.org>]

And also reported by the zero-day bot
(201901110232.L51oPCXW%fengguang.wu@intel.com).

> > After merging the pwm tree, today's linux-next build (arm64-allmodconfig)
> > failed like this:
> > 
> > In file included from drivers/pwm/pwm-imx27.c:15:
> > drivers/pwm/pwm-imx27.c:292:25: error: 'imx_pwm_dt_ids' undeclared here (not in a function); did you mean 'pwm_imx27_dt_ids'?
> >  MODULE_DEVICE_TABLE(of, imx_pwm_dt_ids);

I already asked Thierry if he can fixup my commit with

	s/imx_pwm_dt_ids/pwm_imx27_dt_ids/

(as already suggested by the compiler), but it seems he didn't act on
that yet.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
