From: Andy Grover <andy.grover@oracle.com>
Subject: Re: linux-next: net tree build failure
Date: Mon, 02 Mar 2009 08:38:01 -0800
Message-ID: <49AC0B69.7060608@oracle.com>
References: <20090302180514.9b07c7d9.sfr@canb.auug.org.au> <20090302.014958.31955182.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:31807 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754338AbZCBQiX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2009 11:38:23 -0500
In-Reply-To: <20090302.014958.31955182.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org

David Miller wrote:
> I've fixed this up as follows:
> 
> rds: Fix build on powerpc.

> +#include <asm-generic/bitops/le.h>

Thanks.

Regards -- Andy
