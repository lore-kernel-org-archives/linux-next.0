From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: Bug: "bad unlock balance detected" 2.6.27-rc3-next-20080820
Date: Thu, 21 Aug 2008 10:19:49 +0200
Message-ID: <19f34abd0808210119m70d95ea0t93d9887944a0c84b@mail.gmail.com>
References: <6f31812b0808210004i63b3273ehf65ce9eb139256f0@mail.gmail.com>
	 <19f34abd0808210110s4dd2ec12r6d3044e45a21d67@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from py-out-1112.google.com ([64.233.166.177]:33644 "EHLO
	py-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756336AbYHUITu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Aug 2008 04:19:50 -0400
Received: by py-out-1112.google.com with SMTP id p76so576797pyb.10
        for <linux-next@vger.kernel.org>; Thu, 21 Aug 2008 01:19:50 -0700 (PDT)
In-Reply-To: <19f34abd0808210110s4dd2ec12r6d3044e45a21d67@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: jay kumar <jaykumarks@gmail.com>
Cc: David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Thu, Aug 21, 2008 at 10:10 AM, Vegard Nossum <vegard.nossum@gmail.com> wrote:
> On Thu, Aug 21, 2008 at 9:04 AM, jay kumar <jaykumarks@gmail.com> wrote:
>> While testing 2.6.27-rc3-next-20080820 ,  i observed this    "BUG:bad
>> unlock balance detected" during boot time
>>
> Thanks for the report. The error comes from
>
> commit d9a939fb80ef390b78b3c801f668bd1e35ebc970
> Author: David Howells <dhowells@redhat.com>
> Date:   Thu Aug 7 20:02:20 2008 +1000
>
>    CRED: Make execve() take advantage of copy-on-write credentials
>
> (Added to Cc. I guess it's also nice to Cc linux-next on errors in -next code.)
>
> I couldn't reproduce your original failure, but I've attempted to fix
> it by reordering the mutex unlock and bprm free and removing the
> extraneous unlock (see attached patch; it boots for me without
> errors).

Actually, I was able to reproduce the original issue after all. And
the patch fixed it for me. Please review :-)


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
