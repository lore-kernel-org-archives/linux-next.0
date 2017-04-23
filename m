From: Galo <anglor@varoa.net>
Subject: Re: [PATCH] staging: rtl8188eu: style fixes
Date: Sun, 23 Apr 2017 21:00:47 +0200
Message-ID: <20170423190046.GA7641@lear>
References: <20170420214226.GB1347@lear>
 <20170421042156.GA11495@kroah.com>
 <20170421080623.GA2553@lear>
 <20170421182449.475cc6ea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fnsib-smtp02.srv.cat ([46.16.60.193]:54453 "EHLO
        fnsib-smtp02.srv.cat" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163238AbdDWTA4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 23 Apr 2017 15:00:56 -0400
Content-Disposition: inline
In-Reply-To: <20170421182449.475cc6ea@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-next@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>

On 21-04, Stephen Rothwell wrote:
> Hi Galo,
> 
> On Fri, 21 Apr 2017 10:06:25 +0200 Galo <anglor@varoa.net> wrote:
> >
> > @@ -1461,7 +1460,7 @@ static int rtw_check_join_candidate(struct mlme_priv *pmlmepriv
> >  			goto exit;
> >  	}
> >  
> > -	if (*candidate == NULL || (*candidate)->network.Rssi < competitor->network.Rssi) {
> > +	if (!candidate || (*candidate)->network.Rssi < competitor->network.Rssi) {
> 
> These are not equivalent.  It should be "!*candidate"
> 
> -- 
> Cheers,
> Stephen Rothwell
> 

Thanks a lot for catching this.  I blindly copied from the checkpatch
suggestion, which is indeed wrong:

    CHECK: Comparison to NULL could be written "!candidate"
    #216: FILE: drivers/staging/rtl8188eu/core/rtw_mlme.c:1463:
    +       if (*candidate == NULL || (*candidate)->network.Rssi <
    competitor->network.Rssi)  {}

Fixing this in a new version of the patch, I'll report the issue in
checkpatch separately.

Galo
