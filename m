From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 3/3] netfilter: fix nf_logger name in ebt_ulog.
Date: Thu, 26 Mar 2009 01:04:37 -0700 (PDT)
Message-ID: <20090326.010437.61056270.davem@davemloft.net>
References: <1238053819.13879.4.camel@ice-age>
	<1238054396-9088-3-git-send-email-eric@inl.fr>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:56412
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1755075AbZCZIEt (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2009 04:04:49 -0400
In-Reply-To: <1238054396-9088-3-git-send-email-eric@inl.fr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: eric@inl.fr
Cc: kaber@trash.net, sfr@canb.auug.org.au, linux-next@vger.kernel.org, netdev@vger.kernel.org, netfilter-devel@vger.kernel.org

From: Eric Leblond <eric@inl.fr>
Date: Thu, 26 Mar 2009 08:59:56 +0100

> This patch renames the ebt_ulog nf_logger from "ulog" to "ebt_ulog" to
> be in sync with other modules naming. As this name was currently only
> used for informational purpose, the renaming should be harmless.
> 
> Signed-off-by: Eric Leblond <eric@inl.fr>

Applied.
