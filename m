From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the bpf tree
Date: Tue, 19 Feb 2019 16:41:38 -0800
Message-ID: <CAADnVQK3qg2k67LRiOqDmFnELrFOD1dLkrNbAvbMyu6xGpjBLw@mail.gmail.com>
References: <20190220113729.49f28f73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220113729.49f28f73@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stanislav Fomichev <sdf@google.com>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 19, 2019 at 4:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   tools/testing/selftests/bpf/test_progs.c
>
> between commit:
>
>   f6be4d16039b ("selftests/bpf: make sure signal interrupts BPF_PROG_TEST_RUN")

Ouch. Thanks for the heads up.

Daniel,
should we drop this one from bpf tree ?
I don't think it's strictly necessary.

> from the bpf tree and commits:
>
>   bf0f0fd93945 ("selftests/bpf: add simple BPF_PROG_TEST_RUN examples for flow dissector")
>   ab963beb9f5d ("selftests/bpf: add bpf_spin_lock C test")
>   ba72a7b4badb ("selftests/bpf: test for BPF_F_LOCK")
>
