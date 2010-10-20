From: Kees Cook <kees.cook@canonical.com>
Subject: Re: [PATCH V10] RO/NX protection for loadable kernel modules
Date: Tue, 19 Oct 2010 21:45:39 -0700
Message-ID: <20101020044539.GX6311@outflux.net>
References: <817ecb6f1002011539g3f30416fi60c7c5222cab8f3@mail.gmail.com>
 <201002021429.38331.rusty@rustcorp.com.au>
 <4B67C0F9.2020202@zytor.com>
 <201002081159.45219.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201002081159.45219.rusty@rustcorp.com.au>
Sender: linux-security-module-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Siarhei Liakh <sliakh.lkml@gmail.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi,

On Mon, Feb 08, 2010 at 11:59:44AM +1030, Rusty Russell wrote:
> On Tue, 2 Feb 2010 04:36:49 pm H. Peter Anvin wrote:
> > On 02/01/2010 07:59 PM, Rusty Russell wrote:
> > > On Tue, 2 Feb 2010 10:09:53 am Siarhei Liakh wrote:
> > >> This patch is a logical extension of the protection provided by
> > >> CONFIG_DEBUG_RODATA to LKMs. The protection is provided by splitting
> > >> module_core and module_init into three logical parts each and setting
> > >> appropriate page access permissions for each individual section:
> > >>
> > >>   1. Code: RO+X
> > >>   2. RO data: RO+NX
> > >>   3. RW data: RW+NX
> > >
> > > Thanks, applied!
> > 
> > I also applied this to the -tip tree... do you prefer to carry it or 
> > should I leave it as is?
> 
> I'm always happy for you to do my work for me!  There are no other module
> patches likely to conflict.
> 
> Acked-by: Rusty Russell <rusty@rustcorp.com.au>

Sorry for losing track, but where did this patch end up? I don't see it
in any of the trees I've looked in.

Thanks,

-Kees

-- 
Kees Cook
Ubuntu Security Team
