From: Stanislav Fomichev <sdf@google.com>
Subject: Re: linux-next: manual merge of the net-next tree with the bpf tree
Date: Tue, 19 Feb 2019 19:03:51 -0800
Message-ID: <CAKH8qBtqcx+qXKpq-xNq6_MeciJghppszSF-vHfp0UKsESkcOA@mail.gmail.com>
References: <20190220113729.49f28f73@canb.auug.org.au> <CAADnVQK3qg2k67LRiOqDmFnELrFOD1dLkrNbAvbMyu6xGpjBLw@mail.gmail.com>
 <791e9e85-411e-385b-302f-4a4224f76286@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <791e9e85-411e-385b-302f-4a4224f76286@iogearbox.net>
Sender: netdev-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 19, 2019 at 5:07 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 02/20/2019 01:41 AM, Alexei Starovoitov wrote:
> > On Tue, Feb 19, 2019 at 4:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> Hi all,
> >>
> >> Today's linux-next merge of the net-next tree got a conflict in:
> >>
> >>   tools/testing/selftests/bpf/test_progs.c
> >>
> >> between commit:
> >>
> >>   f6be4d16039b ("selftests/bpf: make sure signal interrupts BPF_PROG_TEST_RUN")
> >
> > Ouch. Thanks for the heads up.
> >
> > Daniel,
> > should we drop this one from bpf tree ?
> > I don't think it's strictly necessary.
>
> Yeah no objections, lets move the selftest one over to bpf-next and
> have it properly integrated. I think test_progs might potentially need
> further topic-split aside from kernel progs like we did in test_verifier.
Do you want me to follow up with a clean rebased bpf-next sefltest patch?
Or you'll take care of it yourself?

> >> from the bpf tree and commits:
> >>
> >>   bf0f0fd93945 ("selftests/bpf: add simple BPF_PROG_TEST_RUN examples for flow dissector")
> >>   ab963beb9f5d ("selftests/bpf: add bpf_spin_lock C test")
> >>   ba72a7b4badb ("selftests/bpf: test for BPF_F_LOCK")
