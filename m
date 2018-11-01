From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] x86/build: Build VSMP support only if selected
Date: Thu, 1 Nov 2018 14:17:27 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1811011416090.1642@nanos.tec.linutronix.de>
References: <20181030230905.xHZmM%akpm@linux-foundation.org> <9e14d183-55a4-8299-7a18-0404e50bf004@infradead.org> <alpine.DEB.2.21.1811011032190.1642@nanos.tec.linutronix.de> <SN6PR15MB2366D7688B41535AF0A331F9C3CE0@SN6PR15MB2366.namprd15.prod.outlook.com>
 <a8f2ac8e-45dc-1c12-e888-6ad880b1306f@scalemp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a8f2ac8e-45dc-1c12-e888-6ad880b1306f@scalemp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eial Czerwacki <eial@scalemp.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, "Shai Fultheim (Shai@ScaleMP.com)" <Shai@ScaleMP.com>, Andrew Morton <akpm@linux-foundation.org>, "broonie@kernel.org" <broonie@kernel.org>, "mhocko@suse.cz" <mhocko@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, "mm-commits@vger.kernel.org" <mm-commits@vger.kernel.org>, X86 ML <x86@kernel.org>, 'Oren Twaig' <oren@scalemp.com>
List-Id: linux-next.vger.kernel.org

On Thu, 1 Nov 2018, Eial Czerwacki wrote:

> Greetings,
> 
> On 11/01/2018 12:39 PM, Shai Fultheim (Shai@ScaleMP.com) wrote:
> > On 01/11/18 11:37, Thomas Gleixner wrote:
> > 
> >> VSMP support is built even if CONFIG_X86_VSMP is not set. This leads to a build
> >> breakage when CONFIG_PCI is disabled as well.
> >>
> >> Build VSMP code only when selected.
> > 
> > This patch disables detect_vsmp_box() on systems without CONFIG_X86_VSMP, due to
> > the recent 6da63eb241a05b0e676d68975e793c0521387141.  This is significant
> > regression that will affect significant number of deployments.
> > 
> > We will reply shortly with an updated patch that fix the dependency on pv_irq_ops,
> > and revert to CONFIG_PARAVIRT, with proper protection for CONFIG_PCI.
> > 
> 
> here is the proper patch which fixes the issue on hand:
> >From ebff534f8cfa55d7c3ab798c44abe879f3fbe2b8 Mon Sep 17 00:00:00 2001
> From: Eial Czerwacki <eial@scalemp.com>
> Date: Thu, 1 Nov 2018 15:08:32 +0200
> Subject: [PATCH] x86/build: Build VSMP support only if CONFIG_PCI is
> selected
> 
> vsmp dependency of pv_irq_ops removed some years ago, so now let's clean
> it up from vsmp_64.c.
> 
> In short, "cap & ctl & (1 << 4)" was always returning 0, as such we can
> remove all the PARAVIRT/PARAVIRT_XXL code handling that.
> 
> However, the rest of the code depends on CONFIG_PCI, so fix it accordingly.
> 
> Signed-off-by: Eial Czerwacki <eial@scalemp.com>
> Acked-by: Shai Fultheim <shai@scalemp.com>

Nice cleanup!

Acked-by: Thomas Gleixner <tglx@linutronix.de>
