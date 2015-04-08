From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 8 Apr 2015 15:03:27 +1000
Message-ID: <20150408150327.313be6a3@canb.auug.org.au>
References: <20150407171858.2ad46594@canb.auug.org.au>
	<20150407084829.GA9577@gmail.com>
	<55239BAD.6040304@iogearbox.net>
	<20150407190527.1633a186@canb.auug.org.au>
	<5523BBE0.8030400@iogearbox.net>
	<55240342.9050900@plumgrid.com>
	<552435DD.5040802@iogearbox.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/crmM37shoAcNtvd44hib=wF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <552435DD.5040802@iogearbox.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Alexei Starovoitov <ast@plumgrid.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>, davem@davemloft.net
List-Id: linux-next.vger.kernel.org

--Sig_/crmM37shoAcNtvd44hib=wF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 07 Apr 2015 21:54:05 +0200 Daniel Borkmann <daniel@iogearbox.net> w=
rote:
>
> On 04/07/2015 06:18 PM, Alexei Starovoitov wrote:
> > On 4/7/15 4:13 AM, Daniel Borkmann wrote:
> >> [ Cc'ing Dave, fyi ]
> >>
> >> On 04/07/2015 11:05 AM, Stephen Rothwell wrote:
> >>> On Tue, 07 Apr 2015 10:56:13 +0200 Daniel Borkmann
> >>> <daniel@iogearbox.net> wrote:
> >>>> On 04/07/2015 10:48 AM, Ingo Molnar wrote:
> >>>>> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>>>>
> >>>>>> After merging the tip tree, today's linux-next build (powerpc
> >>>>>> ppc64_defconfig) failed like this:
> >>>>>>
> >>>>>> kernel/events/core.c: In function 'perf_event_set_bpf_prog':
> >>>>>> kernel/events/core.c:6732:15: error: 'struct bpf_prog_aux' has no
> >>>>>> member named 'prog_type'
> >>>>>>     if (prog->aux->prog_type !=3D BPF_PROG_TYPE_KPROBE) {
> >>>>>>                  ^
> >>>>>>
> >>>>>> Caused by commit 2541517c32be ("tracing, perf: Implement BPF progr=
ams
> >>>>>> attached to kprobes").
> >>>>>
> >>>>> Note, this must be some (rarely triggered) aspect of the ppc64
> >>>>> defconfig that neither x86 randconfigs nor most other arch defconfi=
gs
> >>>>> expose?
> >>>>
> >>>> Note, this is a merge conflict with the work that went via net-next
> >>>> tree,
> >>>> i.e. 24701ecea76b ("ebpf: move read-only fields to bpf_prog and shri=
nk
> >>>> bpf_prog_aux"). I believe that is why it didn't trigger on tip tree.
> >>>>
> >>>> You should be able to resolve it in linux-next by changing the test =
to:
> >>>>
> >>>>     if (prog->prog_type !=3D BPF_PROG_TYPE_KPROBE) {
> >>>
> >>> Thanks Daniel, I will do that tomorrow.  Someone will have to remember
> >>> to tell Linus.
> >>
> >> Yes, indeed, depending which tree is merged first.
> >
> > Daniel analysis is correct, but the fix for kernel/events/core.c
> > should be:
> > - if (prog->aux->prog_type !=3D BPF_PROG_TYPE_KPROBE) {
> > + if (prog->type !=3D BPF_PROG_TYPE_KPROBE) {
> > instead of 'prog->prog_type'
>=20
> Yes, absolutely, thanks!

So I have applied that as a merge fix patch.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/crmM37shoAcNtvd44hib=wF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJLakAAoJEMDTa8Ir7ZwVIOEQAIVkkD+KsdtnOvuAM0r2ivu+
A0oIKLUBjDLykIpDOKyVwQ8rPUb9+no2+DuS/u85eUVmv34VE7xsjA9borwims9N
DnWJENXRoTcxysK6NJduWeG8a5NDGngijei7Gs+zEJLbd8RAek83JMzlupYNBFKq
OMADwlUar3o+cj/fS8E/MDuDwuZX11XpqqQWE4wyBCo1aE2OqMYweMmdAXtzL7cg
sI21TakJnXZkPdd7M0NrOOP0qY8mftkQcPI8kziLsVcF+z+A0fujLIfje/SCzF76
cMhX7IqFgSraBGov7M54s2vdjDwrf0PucHMzqVs3RoI8QTHTFUt4WXbmwKbtGpbP
ryPqhF4QgX0/AAuKFVqmjg00yxiMImilEaQfpuqr84oyiW8xNNL1m8Je4uhD+OKz
XAeclIn17hupxhcJkLax54oW18FC8/HcQNmzM8t+Xv2T3ctuaQzaXSSSoHflu8Ox
JEJpqJG97jaUkowIeZz6Khp5Z1aFhH7nKj/Voqyyko6c/ekq8STQy9DmOQuADe3T
xHghXxdASqkBe2Bqa5PQFcyT+vXzOmVyDz7F/qJoWNB+hrAl+euLYGgvrHx+fAre
/95MwMWvu/B6E5xIi7/7BzU8hnKlDP6h5VtPMenriRYd8yqyn0L0qmH6+QzpMyVq
UgPwT1JM1kYOh+bahvmk
=vpwR
-----END PGP SIGNATURE-----

--Sig_/crmM37shoAcNtvd44hib=wF--
