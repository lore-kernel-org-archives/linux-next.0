From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (powerpc related)
Date: Wed, 20 Jun 2012 20:09:11 +1000
Message-ID: <1340186951.28143.162.camel@pasglop>
References: <20120620175014.a822a766e0f91f7b44f48fa0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120620175014.a822a766e0f91f7b44f48fa0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

On Wed, 2012-06-20 at 17:50 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:

I hate our ABI is a good answer ? :-)

I'll see what I can do tomorrow. Poke me when I'm in the office.

Cheers,
Ben.

> powerpc64-linux-ld: arch/powerpc/net/built-in.o: In function `bpf_slow_path_word':
> (.text+0x90): sibling call optimization to `skb_copy_bits' does not allow automatic multiple TOCs; recompile with -mminimal-toc or -fno-optimize-sibling-calls, or make `skb_copy_bits' extern
> powerpc64-linux-ld: arch/powerpc/net/built-in.o: In function `bpf_slow_path_half':
> (.text+0xe0): sibling call optimization to `skb_copy_bits' does not allow automatic multiple TOCs; recompile with -mminimal-toc or -fno-optimize-sibling-calls, or make `skb_copy_bits' extern
> powerpc64-linux-ld: arch/powerpc/net/built-in.o: In function `bpf_slow_path_byte':
> (.text+0x130): sibling call optimization to `skb_copy_bits' does not allow automatic multiple TOCs; recompile with -mminimal-toc or -fno-optimize-sibling-calls, or make `skb_copy_bits' extern
> powerpc64-linux-ld: arch/powerpc/net/built-in.o: In function `bpf_slow_path_byte_msh':
> (.text+0x180): sibling call optimization to `skb_copy_bits' does not allow automatic multiple TOCs; recompile with -mminimal-toc or -fno-optimize-sibling-calls, or make `skb_copy_bits' extern
> powerpc64-linux-ld: arch/powerpc/net/built-in.o: In function `sk_load_word_negative_offset':
> (.text+0x1dc): sibling call optimization to `bpf_internal_load_pointer_neg_helper' does not allow automatic multiple TOCs; recompile with -mminimal-toc or -fno-optimize-sibling-calls, or make `bpf_internal_load_pointer_neg_helper' extern
> powerpc64-linux-ld: arch/powerpc/net/built-in.o: In function `sk_load_half_negative_offset':
> (.text+0x238): sibling call optimization to `bpf_internal_load_pointer_neg_helper' does not allow automatic multiple TOCs; recompile with -mminimal-toc or -fno-optimize-sibling-calls, or make `bpf_internal_load_pointer_neg_helper' extern
> powerpc64-linux-ld: arch/powerpc/net/built-in.o: In function `sk_load_byte_negative_offset':
> (.text+0x294): sibling call optimization to `bpf_internal_load_pointer_neg_helper' does not allow automatic multiple TOCs; recompile with -mminimal-toc or -fno-optimize-sibling-calls, or make `bpf_internal_load_pointer_neg_helper' extern
> powerpc64-linux-ld: arch/powerpc/net/built-in.o: In function `sk_load_byte_msh_negative_offset':
> (.text+0x2f0): sibling call optimization to `bpf_internal_load_pointer_neg_helper' does not allow automatic multiple TOCs; recompile with -mminimal-toc or -fno-optimize-sibling-calls, or make `bpf_internal_load_pointer_neg_helper' extern
> powerpc64-linux-ld: final link failed: Bad value
> 
> I started building with gcc 4.6.3/binutils 2.22 today.  gcc
> 4.6.0/binutils 2.21 do not produce this error, it produces this instead
> (which has been happening for a long time):
> 
> powerpc64-linux-ld: TOC section size exceeds 64k
> 
