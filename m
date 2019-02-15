From: Peter Oskolkov <posk@posk.io>
Subject: Re: linux-next: Tree for Feb 15 (net/core/lwt_bpf.c)
Date: Fri, 15 Feb 2019 09:42:10 -0800
Message-ID: <CAFTs51WKL7u+H_4_S1au_dGw20avosJt4n63pkhUXr7wV4aC6A@mail.gmail.com>
References: <20190215170342.1b704e7c@canb.auug.org.au> <51ee23dd-b852-db61-ef21-ff5819488386@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <51ee23dd-b852-db61-ef21-ff5819488386@infradead.org>
Sender: netdev-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 15, 2019 at 8:48 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 2/14/19 10:03 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20190214:
> >
>
> on x86_64:
>
> ld: net/core/lwt_bpf.o: in function `bpf_lwt_xmit_reroute':
> lwt_bpf.c:(.text+0x11e): undefined reference to `ip_route_output_flow'
> ld: net/core/lwt_bpf.o: in function `bpf_input':
> lwt_bpf.c:(.text+0x9d3): undefined reference to `ip_route_input_noref'

A fix suggested here: https://patchwork.ozlabs.org/patch/1043098/

>
>
> Full randconfig file is attached.
>
> --
> ~Randy
