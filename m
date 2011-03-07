From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: mx51_efika: update platform data for new mfd
	changes
Date: Mon, 7 Mar 2011 14:47:00 +0000
Message-ID: <20110307144700.GF1829@sirena.org.uk>
References: <20110304080653.3f2c3f19@debxo> <4D710FF9.6040305@ru.mvista.com> <20110304083822.0f40d120@debxo> <4D713670.70506@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D713670.70506@ru.mvista.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: Andres Salomon <dilinger@queued.net>, Samuel Ortiz <sameo@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Amit Kucheria <amit.kucheria@canonical.com>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Fri, Mar 04, 2011 at 09:58:56PM +0300, Sergei Shtylyov wrote:
> Andres Salomon wrote:

>>>> MFD changes in c738892f cause the mc13xxx_platform_data struct

>>>     Linus asks to also specify the commit summary in parens.

>> Also, what?  If there are changes to how patches should be submitted,
>> please provide a reference (Documentation/SubmittingPatches should
>> be updated, as well).

>    I have no time to rummage in the mail archives, sorry.

There's been multiple discussions of this.  The issue is that commit IDs
only mean something in specific trees and go bad if someone rebases,
and they aren't legibile by humans (so even if the commit is in
something like Linus' tree the reader still needs a git repository to
figure out what changes are being talked about).
