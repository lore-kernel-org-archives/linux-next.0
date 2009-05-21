From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH 2/2] Staging: comedi: data.c should include delay.h
Date: Thu, 21 May 2009 06:55:51 -0700
Message-ID: <20090521135551.GB29375@suse.de>
References: <1242219648-16165-1-git-send-email-a.beregalov@gmail.com> <1242219648-16165-2-git-send-email-a.beregalov@gmail.com> <20090513132342.GA16280@orion> <a4423d670905210608k25a92253j21fc231dd467bff2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755986AbZEUOEN@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a4423d670905210608k25a92253j21fc231dd467bff2@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, May 21, 2009 at 05:08:28PM +0400, Alexander Beregalov wrote:
> 2009/5/13 Alexander Beregalov <a.beregalov@gmail.com>:
> > Fix this build error:
> > .../data.c:86: error: implicit declaration of function 'udelay'
> >
> > Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> > ---
> 
> Greg,
> Please apply instead my another patch, which includes delay.h in comedidev.h.

Ok, will do.

thanks,

greg k-h
