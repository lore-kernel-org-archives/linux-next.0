From: Masanari Iida <standby24x7@gmail.com>
Subject: Re: make mandocs build failure with next-20150210
Date: Mon, 16 Feb 2015 11:29:17 +0900
Message-ID: <CALLJCT11o3CkhmsDF7nJxg-r0zoEaee4eScy9Xc5LVEg7Vg4Yg@mail.gmail.com>
References: <CA+r1ZhhXpFWsBJohzyseUh1bVj51HcjzMPejY0wzmjgSvhaOHg@mail.gmail.com>
	<20150211072757.166344e7@canb.auug.org.au>
	<1423664340.10724.40.camel@linux.intel.com>
	<20150211154844.GA18637@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150211154844.GA18637@kroah.com>
Sender: linux-doc-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Cox <alan@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Jim Davis <jim.epost@gmail.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 12, 2015 at 12:48 AM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, Feb 11, 2015 at 02:19:00PM +0000, Alan Cox wrote:
>> On Wed, 2015-02-11 at 07:27 +1100, Stephen Rothwell wrote:
>> > Hi Jim,
>> >
>> > On Tue, 10 Feb 2015 11:40:23 -0700 Jim Davis <jim.epost@gmail.com> wrote:
>> > >
>> > >   DOCPROC Documentation/DocBook/device-drivers.xml
>> > > docproc: .//include/linux/i2o.h: No such file or directory
>> > > make[1]: *** [Documentation/DocBook/device-drivers.xml] Error 1
>> >
>> > Presumably caused by commit 2cbf7fe2d5d3 ("i2o: move to staging") from
>> > the staging tree.
>>
>> Yep - I sent GregKH a fix.
>
> You did?  Did I apply it?  I don't see it in my to-apply queue
> anywhere...
>
> Care to resend?
>

This warning started to appear on Linus's tree, after staging pull
request was merged.

Regards,
Masanari Iida
