From: "Jesper Juhl" <jesper.juhl@gmail.com>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Sat, 12 Jul 2008 20:59:58 +0200
Message-ID: <9a8748490807121159o1153e9f4r7003f3bbfa563d@mail.gmail.com>
References: <20080701213310.3fcdeb8c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.31]:1142 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972AbYGLS77 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 12 Jul 2008 14:59:59 -0400
Received: by yw-out-2324.google.com with SMTP id 9so2130203ywe.1
        for <linux-next@vger.kernel.org>; Sat, 12 Jul 2008 11:59:58 -0700 (PDT)
In-Reply-To: <20080701213310.3fcdeb8c.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org, Nick Andrew <nick@nick-andrew.net>

2008/7/1 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Alan,
>
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/usb/serial/ftdi_sio.c between commit
> 0bb08241ce68aaa70b7b804b4d6319d8bad3ae24 ("Tighten up the use of loose")
> from the trivial tree and commit ce8194a09dee5b7e101467aba6b7cd5617b1cd0f
> ("23-usb-serial-api-change") from the ttydev tree.
>
> The conflict is just in a comment.  I have applied the spelling
> correction from the former to the version of the file from the ttydev
> tree.
>
Ok, do you want me to make any changes to the contents of Trivial or
can I just leave thins as-is?

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please http://www.expita.com/nomime.html
