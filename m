From: Rakib Mullick <rakib.mullick@gmail.com>
Subject: Re: linux-next: tty tree build warning
Date: Sun, 24 Jan 2010 09:42:23 +0600
Message-ID: <b9df5fa11001231942y2703e825k8b46b6aebaef38a0@mail.gmail.com>
References: <20100120171901.b2e06465.sfr@canb.auug.org.au>
	 <b9df5fa11001202022q22c2d81cs5b90f694be37c1f4@mail.gmail.com>
	 <20100121230331.GA29796@kroah.com>
	 <b9df5fa11001230453k4a874ebamff02b64f7d6fcd84@mail.gmail.com>
	 <4B5B0B10.2000009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f190.google.com ([209.85.222.190]:47733 "EHLO
	mail-pz0-f190.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752173Ab0AXDmZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 23 Jan 2010 22:42:25 -0500
In-Reply-To: <4B5B0B10.2000009@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Slaby <jirislaby@gmail.com>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Michael H. Warfield" <mhw@wittsend.com>

On 1/23/10, Jiri Slaby <jirislaby@gmail.com> wrote:
> On 01/23/2010 01:53 PM, Rakib Mullick wrote:
>
> Why not just param_array(int) instead of whole parsing in ip2_setup?
>
Parameter is passed as strings and current ip2_setup deals with strings.
And using param_string() we can do it at minimum change. Just trying to make
sure that if ip2 parameter is passed at module load then we are
calling ip2_setup.

thanks,
>  --
>
> js
>
