From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] staging: rtl8188eu: style fixes
Date: Fri, 21 Apr 2017 18:24:49 +1000
Message-ID: <20170421182449.475cc6ea@canb.auug.org.au>
References: <20170420214226.GB1347@lear>
        <20170421042156.GA11495@kroah.com>
        <20170421080623.GA2553@lear>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44039 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1036641AbdDUIY7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Apr 2017 04:24:59 -0400
In-Reply-To: <20170421080623.GA2553@lear>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Galo <anglor@varoa.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>

Hi Galo,

On Fri, 21 Apr 2017 10:06:25 +0200 Galo <anglor@varoa.net> wrote:
>
> @@ -1461,7 +1460,7 @@ static int rtw_check_join_candidate(struct mlme_priv *pmlmepriv
>  			goto exit;
>  	}
>  
> -	if (*candidate == NULL || (*candidate)->network.Rssi < competitor->network.Rssi) {
> +	if (!candidate || (*candidate)->network.Rssi < competitor->network.Rssi) {

These are not equivalent.  It should be "!*candidate"

-- 
Cheers,
Stephen Rothwell
