From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/3] netfilter: fix warning about invalid const usage
Date: Thu, 26 Mar 2009 01:03:32 -0700 (PDT)
Message-ID: <20090326.010332.160800916.davem@davemloft.net>
References: <1238053819.13879.4.camel@ice-age>
	<1238054396-9088-1-git-send-email-eric@inl.fr>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:56398
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754020AbZCZIDo (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2009 04:03:44 -0400
In-Reply-To: <1238054396-9088-1-git-send-email-eric@inl.fr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: eric@inl.fr
Cc: kaber@trash.net, sfr@canb.auug.org.au, linux-next@vger.kernel.org, netdev@vger.kernel.org, netfilter-devel@vger.kernel.org

From: Eric Leblond <eric@inl.fr>
Date: Thu, 26 Mar 2009 08:59:54 +0100

> This patch fixes the declaration of the logger structure in ebt_log
> and ebt_ulog: I forgot to remove the const option from their declaration
> in the commit ca735b3aaa945626ba65a3e51145bfe4ecd9e222 ("netfilter:
> use a linked list of loggers").
> 
> Pointed-out-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Eric Leblond <eric@inl.fr>

Applied.
