From: Stefani Seibold <stefani@seibold.net>
Subject: Re: linux-next: build warnings after merge of the akpm tree
Date: Fri, 26 Oct 2012 07:44:51 +0200
Message-ID: <1351230291.12511.7.camel@wall-e>
References: <20121025142854.1924363d6a607004f918ac63@canb.auug.org.au>
	 <20121025143044.d21e2c29b16ee2005f93a371@canb.auug.org.au>
	 <508948de.01dc440a.58ed.ffffff17SMTPIN_ADDED@mx.google.com>
	 <20121025152337.7f14919d.akpm@linux-foundation.org>
	 <20121025223656.GA3805@richard.(null)>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121025223656.GA3805@richard.(null)>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Yang <weiyang@linux.vnet.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, richard -rw- weinberger <richard.weinberger@gmail.com>, Jiri Kosina <jkosina@suse.cz>
List-Id: linux-next.vger.kernel.org

Am Freitag, den 26.10.2012, 06:36 +0800 schrieb Richard Yang:

> >
> >And holy cow that code is hard to read :( Why was kfifo_in()
> >implemented as a macro, anyway?  AFAICT all its args have a known type,
> >so we could have used a proper C interface, which would have fixed all
> >this nicely.
> 

Thats simple for performance reasons, the compiler remove most of the
code during the compile stage, so no runtime checks are necessary. And
it is the only way since C does not provides templates like C++.
 
> Hmm, move the definition of kfifo_in()/kfifo_out() into the kfifo.c?
> 

Don't do it. this will result in a performance degradation. Look at the
disassembled code by each change in code and compare it with the
previous one. I don't believe that you can produce better code.
