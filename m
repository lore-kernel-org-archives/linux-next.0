From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: Boot failure on x86_64 (OOPS set_cpu_sibling_map() )
Date: Mon, 3 Aug 2009 14:50:59 +0200
Message-ID: <20090803125059.GB14442@aftab>
References: <20090730182143.eadf36e6.sfr@canb.auug.org.au>
 <4A718338.6050907@in.ibm.com>
 <20090730135623.GB16659@aftab>
 <20090803093144.GC9074@elte.hu>
 <20090803101401.GA14442@aftab>
 <20090803120739.GA29156@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755029AbZHCMvK@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090803120739.GA29156@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Sachin Sant <sachinp@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Ingo,

On Mon, Aug 03, 2009 at 02:07:39PM +0200, Ingo Molnar wrote:
> The thing that was blocking this commit is really the insufficient=20
> sched-domains integration of said NUMA bits. I think the NUMA bits=20
> look good and if the EDAC tree makes use of it we can merge it in=20
> .32.
>
> Mind preparing a separate branch for it (.31-rc5 based) and send me=20
> a pull request so that we can share the commit between the EDAC tree=20
> and the x86 tree?

Well, Andreas says the patches need a little polishing and he'll be
sending updated versions soon so you can pick them up. And since the
EDAC MCE stuff might still change before .32 merge window opens,
let's synchronize our pull requests instead. In the meantime, I'll be
rediffing the EDAC stuff against -tip for linux-next.

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
