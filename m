From: Steve Wise <swise@opengridcomputing.com>
Subject: Re: [PATCH] RDMA/cxgb4: Add default_llseek to debugfs files.
Date: Wed, 29 Sep 2010 12:49:05 -0500
Message-ID: <4CA37C11.2040603@opengridcomputing.com>
References: <20100929141112.26944.21931.stgit@build.ogc.int>	<adawrq431sr.fsf@cisco.com> <4CA37715.4020302@opengridcomputing.com> <adask0s30sr.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.opengridcomputing.com ([209.198.142.2]:50779 "EHLO
	smtp.opengridcomputing.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752586Ab0I2RtM (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Sep 2010 13:49:12 -0400
In-Reply-To: <adask0s30sr.fsf@cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-rdma@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/29/2010 12:41 PM, Roland Dreier wrote:
>   >  I assume you mean debugs_read()...Like this?
>
> Sorry, yeah, was looking at the old code.  But yes, that code seems a
> lot simpler.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>    

I'll change it, test it,  and send you a patch.
