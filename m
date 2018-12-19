From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Tue, 18 Dec 2018 21:07:06 -0600
Message-ID: <32bfba42-ca52-57e1-d5d9-ce1d90bafc8a@embeddedor.com>
References: <20181129112428.45287471@canb.auug.org.au>
 <20181219134243.674b80b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181219134243.674b80b7@canb.auug.org.au>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, Kees Cook <keescook@google.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 12/18/18 8:42 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 29 Nov 2018 11:24:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the net-next tree, today's linux-next build
>> (x86_64_allmodconfig) produced this warning:
>>
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c: In function 'run_xdp':
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:324:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>     bpf_warn_invalid_xdp_action(xdp_act);
>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:325:2: note: here
>>    case XDP_ABORTED:
>>    ^~~~
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:326:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>     trace_xdp_exception(priv->net_dev, xdp_prog, xdp_act);
>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c:327:2: note: here
>>    case XDP_DROP:
>>    ^~~~
>>
>> Introduced by commit
>>
>>    7e273a8ebdd3 ("dpaa2-eth: Add basic XDP support")
>>
>> This due to my use of -Wimplicit-fallthrough.  This is new code.  The
>> warning can be suppressed by adding a comment like /* fall through */
>> at the appropriate places to indicate that the fallthrough is intended.
> 
> I am still seeing these warnings.
> 

That's weird. I don't see them anymore in next-20181218.

They were fixed by this commit: c1cb11bcbd09f5f027cbc7fadddab169714948df

Thanks
