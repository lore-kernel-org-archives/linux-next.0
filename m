From: Paolo Abeni <pabeni@redhat.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Mon, 17 Dec 2018 16:54:33 +0100
Message-ID: <f3cb396d0e2c6361866384eeacc7f81622b16366.camel@redhat.com>
References: <20181217123645.42a20fe5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217123645.42a20fe5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Mon, 2018-12-17 at 12:36 +1100, Stephen Rothwell wrote:
> After merging the net-next tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from net/core/dev.c:148:
> net/core/dev.c: In function 'napi_gro_complete':
> net/core/dev.c:5364:26: error: 'inet_gro_complete' undeclared (first use in this function); did you mean 'eth_gro_complete'?
>        ipv6_gro_complete, inet_gro_complete,
>                           ^~~~~~~~~~~~~~~~~
> include/linux/indirect_call_wrapper.h:32:41: note: in definition of macro 'INDIRECT_CALL_2'
>  #define INDIRECT_CALL_2(f, name, ...) f(__VA_ARGS__)
>                                          ^~~~~~~~~~~
> 
> and on ....
> 
> Caused by commit
> 
>   aaa5d90b395a ("net: use indirect call wrappers at GRO network layer")
> 
> inet_gro_complete() is declared in include/net/inet_comon.h which is
> not directly included in net/core/dev.c.
> 
> I have used the net-next tree from next-20181214 for today.

My fault, I should have tested more kernel configs. This fails with
CONFIG_RETPOLINE=n

A fix has been posted here:

https://marc.info/?l=linux-netdev&m=154504685327698&w=2

Thanks,

Paolo
