From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the namespace tree with the m68k tree
Date: Wed, 11 May 2011 09:36:31 +0200
Message-ID: <BANLkTi=JRiafXn8SjxM9eKup3hvNHyB3rw@mail.gmail.com>
References: <20110511140225.2c7e300f.sfr@canb.auug.org.au>
	<m1liydeuqs.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <m1liydeuqs.fsf@fess.ebiederm.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, May 11, 2011 at 06:17, Eric W. Biederman <ebiederm@xmission.com=
> wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> Today's linux-next merge of the namespace tree got a conflict in
>> arch/m68k/kernel/entry_mm.S between commit 55e1af1ab184 ("m68k: Merg=
e mmu
>> and non-mmu versions of sys_call_table") from the m68k tree and comm=
it
>> e975ee91dcc1 ("ns: Wire up the setns system call") from the namespac=
e
>> tree.
>>
>> I just used the m68k version of that file and that should be all tha=
t is
>> necessary.
>
> Sounds good. =C2=A0Gert asked me to check in that conflict (probably =
so
> bisects will continue to work), and if the commit id is right it look=
s
> like the m68k tree is seeing active development on that change right =
now.

I can add the syscall as soon as sys_setns() hits mainline.
That's what we usually do with new syscalls.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
