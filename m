From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the i2c tree
Date: Thu, 15 Jun 2017 18:48:01 +1000
Message-ID: <20170615184751.1efd2bcf@canb.auug.org.au>
References: <20170605111131.3a113eaa@canb.auug.org.au>
        <20170615113452.1fa1dc67@canb.auug.org.au>
        <20170615070244.GA1476@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615070244.GA1476@katana>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Wolfram,

On Thu, 15 Jun 2017 09:02:44 +0200 Wolfram Sang <wsa@the-dreams.de> wrote:
>
> > > drivers/i2c/i2c-stub.c:18:0: warning: "DEBUG" redefined
> > >  #define DEBUG
> > >  ^
> > > <command-line>:0:0: note: this is the location of the previous definition
> > > 
> > > Introduced by commit
> > > 
> > >   6c42778780c4 ("i2c: stub: use pr_fmt")  
> > 
> > I am still getting this ...  
> 
> Sorry, that slipped through the cracks, will fix today!

Thanks.

> Thanks for the reminder.

I am trying to be more proactive with these things.
-- 
Cheers,
Stephen Rothwell
