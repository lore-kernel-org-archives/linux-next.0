From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Wed, 6 Dec 2017 10:32:58 +1100
Message-ID: <20171206103258.4920acde@canb.auug.org.au>
References: <20171204141956.5b90bc18@canb.auug.org.au>
        <20171204093953.iwhew4w7wgzm6b3q@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753270AbdLEXdB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Dec 2017 18:33:01 -0500
In-Reply-To: <20171204093953.iwhew4w7wgzm6b3q@dell>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rui Feng <rui_feng@realsil.com.cn>, Daniel Bristot de Oliveira <bristot@redhat.com>, Perry Yuan <perry_yuan@dell.com>

Hi Lee,

On Mon, 4 Dec 2017 09:39:53 +0000 Lee Jones <lee.jones@linaro.org> wrote:
>
> > I added the following fix patch:
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 4 Dec 2017 14:10:34 +1100
> > Subject: [PATCH] misc: rtsx: fix symbol clashes
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>  
> 
> Although I'm not sure how to apply this manually without scissors.

Just take everything from the From: line above to the end and give it
to "git am".  Yes, this may involve saving the email and editting it,
sorry about that.

-- 
Cheers,
Stephen Rothwell
