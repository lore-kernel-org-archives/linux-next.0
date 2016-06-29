From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: mwifiex: Fixed endianness for event TLV type
 TLV_BTCOEX_WL_SCANTIME
Date: Wed, 29 Jun 2016 15:52:59 +0000 (UTC)
Message-ID: <20160629155259.08DB1613A4@smtp.codeaurora.org>
References: <1466050770-21789-1-git-send-email-prasunmaiti87@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40090 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752318AbcF2PyA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jun 2016 11:54:00 -0400
In-Reply-To: <1466050770-21789-1-git-send-email-prasunmaiti87@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Prasun Maiti <prasunmaiti87@gmail.com>
Cc: Amitkumar Karwar <akarwar@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, Linux Wireless <linux-wireless@vger.kernel.org>, Linux Next <linux-next@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Prasun Maiti <prasunmaiti87@gmail.com> wrote:
> The two members min_scan_time and max_scan_time of structure
> "mwifiex_ie_types_btcoex_scan_time" are of two bytes each. The values
> are assigned directtly from firmware without endian conversion handling.
> So, wrong datas will get saved in big-endian systems.
> 
> This patch converts the values into cpu's byte order before assigning them
> into the local members.
> 
> Signed-off-by: Prasun Maiti <prasunmaiti87@gmail.com>

I would like to see Reviewed-by from someone else before I apply this.

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9179811/
