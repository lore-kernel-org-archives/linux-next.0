From: Borislav Petkov <borislav.petkov@amd.com>
Subject: Re: Boot failure on x86_64 (OOPS set_cpu_sibling_map() )
Date: Tue, 4 Aug 2009 16:31:50 +0200
Message-ID: <20090804143150.GC1870@aftab>
References: <20090730182143.eadf36e6.sfr@canb.auug.org.au>
 <4A718338.6050907@in.ibm.com>
 <20090730135623.GB16659@aftab>
 <20090803093144.GC9074@elte.hu>
 <20090803101401.GA14442@aftab>
 <20090803120739.GA29156@elte.hu>
 <20090803125059.GB14442@aftab>
 <20090804135029.GA6775@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932621AbZHDOc2@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090804135029.GA6775@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Sachin Sant <sachinp@in.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 04, 2009 at 03:50:29PM +0200, Ingo Molnar wrote:
> > > Mind preparing a separate branch for it (.31-rc5 based) and send =
me=20
> > > a pull request so that we can share the commit between the EDAC t=
ree=20
> > > and the x86 tree?
> >=20
> > Well, Andreas says the patches need a little polishing and he'll=20
> > be sending updated versions soon so you can pick them up. And=20
> > since the EDAC MCE stuff might still change before .32 merge=20
> > window opens, let's synchronize our pull requests instead. In the=20
> > meantime, I'll be rediffing the EDAC stuff against -tip for=20
> > linux-next.
>=20
> Would you rebase just due to this commit?

No, I wanted to keep the opportunity to be able to rebase the whole
series until the very last minute before the merge window, should
anything need to be changed...

> No need for that, feel free to carry it until Andreas sends an update=
d
> version. Then i can put it into a separate .31-rc5 based topic that
> you can pull into the EDAC tree.

=2E.. and this is basically what I had in mind: After you pull them in,
I'll rebase my branch against yours for linux-next. I see that Stephen
pulls edac before -tip in linux-next so I'll ask him nicely to reorder
those. This approach makes most sense anyways since edac relies on a
bunch of x86 facilities (topology bits, rd/wrmsr_on_cpus, mcheck etc)
and it is only natural that it goes second in linux-next, right?

Then the pull requests will go out in the same order during the merge
window and we should be fine.

--=20
Regards/Gruss,
Boris.

Operating | Advanced Micro Devices GmbH
  System  | Karl-Hammerschmidt-Str. 34, 85609 Dornach b. M=FCnchen, Ger=
many
 Research | Gesch=E4ftsf=FChrer: Thomas M. McCoy, Giuliano Meroni
  Center  | Sitz: Dornach, Gemeinde Aschheim, Landkreis M=FCnchen
  (OSRC)  | Registergericht M=FCnchen, HRB Nr. 43632
