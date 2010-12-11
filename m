From: Kees Cook <kees.cook@canonical.com>
Subject: Re: [PATCH 3/3 V13] RO/NX protection for loadable kernel
Date: Sat, 11 Dec 2010 15:15:02 -0800
Message-ID: <20101211231502.GZ4464@outflux.net>
References: <4CE2F914.9070106@free.fr>
 <24422.1290656467@localhost>
 <20101126182355.62615dff@mat-laptop>
 <20101208221951.GO5750@outflux.net>
 <20101211001857.4c5e0794@mat-laptop>
 <20101211002750.GT4464@outflux.net>
 <20101211115735.21b616fe@mat-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101211115735.21b616fe@mat-laptop>
Sender: linux-security-module-owner@vger.kernel.org
To: mat <castet.matthieu@free.fr>
Cc: Valdis.Kletnieks@vt.edu, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Siarhei Liakh <sliakh.lkml@gmail.com>
List-Id: linux-next.vger.kernel.org

On Sat, Dec 11, 2010 at 11:57:35AM +0100, mat wrote:
> http://marc.info/?l=linux-security-module&m=129105456828505&w=2

Ah-ha! Thanks for the pointer. So, instead of the other explicit jump_table
fix, can this get pushed into tip?

Thanks!

-Kees

-- 
Kees Cook
Ubuntu Security Team
