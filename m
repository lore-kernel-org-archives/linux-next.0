From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: Next May 13:[drivers/base/firmware*] Bug while booting on x86
Date: Fri, 15 May 2009 16:58:31 +0530
Message-ID: <4A0D51DF.4020108@in.ibm.com>
References: <20090513164832.c8a0de7d.sfr@canb.auug.org.au>  <4A0AC5E6.2010402@in.ibm.com> <1242316467.3393.14.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp09.au.ibm.com ([202.81.31.142]:38656 "EHLO
	e23smtp09.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220AbZEOL2d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 May 2009 07:28:33 -0400
In-Reply-To: <1242316467.3393.14.camel@macbook.infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

David Woodhouse wrote:
> Oops. Does this fix it?
>
> --- a/drivers/base/firmware_class.c
> +++ b/drivers/base/firmware_class.c
> @@ -328,7 +328,7 @@ firmware_data_write(struct kobject *kobj, struct
> bin_attribute *bin_attr,
>
>  		memcpy(page_data + page_ofs, buffer, page_cnt);
>
> -		kunmap(page_data);
> +		kunmap(fw_priv->pages[page_nr]);
>  		buffer += page_cnt;
>  		offset += page_cnt;
>  		count -= page_cnt;
Thanks David. This patch fixed the issue.

Tested-by : Sachin Sant <sachinp@in.ibm.com>

Thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
