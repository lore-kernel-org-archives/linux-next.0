From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 7 Apr 2015 19:05:27 +1000
Message-ID: <20150407190527.1633a186@canb.auug.org.au>
References: <20150407171858.2ad46594@canb.auug.org.au>
	<20150407084829.GA9577@gmail.com>
	<55239BAD.6040304@iogearbox.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BTLmM9b5AmB6dPoDXhQ66vQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55239BAD.6040304@iogearbox.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@plumgrid.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
List-Id: linux-next.vger.kernel.org

--Sig_/BTLmM9b5AmB6dPoDXhQ66vQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 07 Apr 2015 10:56:13 +0200 Daniel Borkmann <daniel@iogearbox.net> w=
rote:
>
> On 04/07/2015 10:48 AM, Ingo Molnar wrote:
> >
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> >> After merging the tip tree, today's linux-next build (powerpc
> >> ppc64_defconfig) failed like this:
> >>
> >> kernel/events/core.c: In function 'perf_event_set_bpf_prog':
> >> kernel/events/core.c:6732:15: error: 'struct bpf_prog_aux' has no memb=
er named 'prog_type'
> >>    if (prog->aux->prog_type !=3D BPF_PROG_TYPE_KPROBE) {
> >>                 ^
> >>
> >> Caused by commit 2541517c32be ("tracing, perf: Implement BPF programs
> >> attached to kprobes").
> >
> > Note, this must be some (rarely triggered) aspect of the ppc64
> > defconfig that neither x86 randconfigs nor most other arch defconfigs
> > expose?
>=20
> Note, this is a merge conflict with the work that went via net-next tree,
> i.e. 24701ecea76b ("ebpf: move read-only fields to bpf_prog and shrink
> bpf_prog_aux"). I believe that is why it didn't trigger on tip tree.
>=20
> You should be able to resolve it in linux-next by changing the test to:
>=20
>    if (prog->prog_type !=3D BPF_PROG_TYPE_KPROBE) {

Thanks Daniel, I will do that tomorrow.  Someone will have to remember
to tell Linus.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/BTLmM9b5AmB6dPoDXhQ66vQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI53cAAoJEMDTa8Ir7ZwVzW8P/j8nv4tRB4TVxYUYaMaD8pnv
VDNTPSqKYzGIiErLTW4No+jXAq/L7v7F4Va34XQnD8XzdjzG79jAtlJOocHwf7Id
mzsNPmw7UsYXQMUU/fx9yXAgaWWm+9aQofiahvAG4hpz/VWdvvupu44D/libYh9v
bIshGf8OwCgr7oeQHQ3zbJIUPjCMAK6rRQpWpo51vxJPGLqGVET60bUcQ6uS0AEI
OjBUQ8CUBwft1Ycj4/h9SClfGOm2IqwRiEawOattcXkwSf5iooTaR9c6l/S1qyMN
tHXeziSRNaKrOsVJGdms3Tw6ftYGJsV7HciNrWD9uoJyvnIyGZN642sE8lLocnXT
Z6m7mnbaT1JNJZ29Gvby2Z2zdCz6Fy1koEnT2CWBc2HM6xaF1/YcTcA9zwksRcJb
vi9KacAnlr0S+T615UHtl/BUvD571wjFcFO//AF/oxkGCpijPrCrLnSw4xAlSRFn
u7fDjOU/UNMhmV3lQTzRU0jaDIGyaxFifLBbnWs10LVpAoMUH7B8EApQTF4hotp3
YqAptFXp9OaksvxwLuPjw9ZP2aTpTbGMXjEVUSaYi/K8soj4Qm1cDo7DqY+BQLy9
qXA/Z1yiVuYsoxKHjsWgt3x3HJLr2hAJuR458v8fm0st3SZ8/A/GXkoG0ZCbQ9M6
s8/z4nAxamxv5BpjAjzf
=J/Li
-----END PGP SIGNATURE-----

--Sig_/BTLmM9b5AmB6dPoDXhQ66vQ--
