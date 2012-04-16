From: Will Drewry <wad@chromium.org>
Subject: Re: linux-next: build failure after merge of the final tree (security
 tree related)
Date: Mon, 16 Apr 2012 10:44:09 -0500
Message-ID: <CABqD9haMbVKn=cKuE75hSQ1YG9FgnzDhAaGUhTvk0kvJS8MGGg@mail.gmail.com>
References: <20120416154607.302f7ae245472e1e917dacef@canb.auug.org.au>
	<CABqD9hauxzd4vVbxyC5M1p9e6mLt1cjYP7wbhzTKPi3iMpc0kg@mail.gmail.com>
	<1334590461.2250.0.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1334590461.2250.0.camel@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Paris <eparis@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 16, 2012 at 10:34 AM, Eric Paris <eparis@redhat.com> wrote:
> On Mon, 2012-04-16 at 10:32 -0500, Will Drewry wrote:
>
>> Thanks for this, and the other two fixes! =A0I'll pull together a pa=
tch
>> fixing up the other call sites. =A0My past revisions had avoided thi=
s by
>> using a new symbol, and I totally forgot to touch these up in the la=
st
>> round.
>>
>> What's the best way to submit the clean up -- against the security-n=
ext tree?
>>
>> Thanks and sorry for the noise!
>
> Just send fixes to James and they will get picked up by Stephen the d=
ay
> after he commits them to security-next.

Cool - thanks!
