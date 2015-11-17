From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: next build: 235 warnings 3 failures (next/next-20151117)
Date: Tue, 17 Nov 2015 09:01:56 -0800
Message-ID: <1447779716.22599.123.camel@edumazet-glaptop2.roam.corp.google.com>
References: <564a9961.878b420a.331b8.fffffd62@mx.google.com>
	 <4694362.ZPL12j6kR2@wuerfel> <20151117164453.GF30101@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:36437 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751710AbbKQRB6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2015 12:01:58 -0500
In-Reply-To: <20151117164453.GF30101@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, kernel-build-reports@lists.linaro.org, olof@lixom.net, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, 2015-11-17 at 16:44 +0000, Will Deacon wrote:

> Do you know the usage in the kernel causing this warning?

/**
 * sk_state_load - read sk->sk_state for lockless contexts
 * @sk: socket pointer
 *
 * Paired with sk_state_store(). Used in places we do not hold socket lock :
 * tcp_diag_get_info(), tcp_get_info(), tcp_poll(), get_tcp4_sock() ...
 */
static inline int sk_state_load(const struct sock *sk)
{
        return smp_load_acquire(&sk->sk_state);
}
