From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: linux-next: manual merge of the driver-core tree with the  tree
Date: Fri, 15 Feb 2013 11:04:02 -0600
Message-ID: <511E6A82.9010301@lwfinger.net>
References: <20130215160124.52d9bfb269ad1ffd390d4851@canb.auug.org.au> <20130215052421.GA3789@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:64781 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882Ab3BOREF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Feb 2013 12:04:05 -0500
In-Reply-To: <20130215052421.GA3789@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, "John W. Linville" <linville@tuxdriver.com>

On 02/14/2013 11:24 PM, Greg KH wrote:
> On Fri, Feb 15, 2013 at 04:01:24PM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> Today's linux-next merge of the driver-core tree got a conflict in
>> drivers/net/wireless/rtlwifi/Kconfig between commit 06e7cda3ce30
>> ("rtlwifi: Rework Kconfig") from the wireless-next tree and commit
>> 6cba014857f4 ("drivers/net/wireless/rtlwifi: remove depends on
>> CONFIG_EXPERIMENTAL") from the driver-core tree.
>>
>> I fixed it up (the former is a superset of the latter, so I used that)
>> and can carry the fix as necessary (no action is required).
>
> That sounds fine, thanks.

I agree. Sorry for any conflict.

Thanks,

Larry
