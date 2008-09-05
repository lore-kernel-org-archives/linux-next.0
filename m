From: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] ucb1400_ts depends SND_AC97_BUS
Date: Fri, 5 Sep 2008 14:33:18 -0400
Message-ID: <d120d5000809051133h1a51d68bs56db0397a321bc9f@mail.gmail.com>
References: <20061209003635.e778ff76.randy.dunlap@oracle.com>
	 <20080904195744.f367cd2d.randy.dunlap@oracle.com>
	 <alpine.LFD.1.10.0809050028590.23787@xanadu.home>
	 <20080904214444.0dccf859.randy.dunlap@oracle.com>
	 <alpine.LFD.1.10.0809050104560.23787@xanadu.home>
	 <s5htzcvt7id.wl%tiwai@suse.de>
	 <alpine.LFD.1.10.0809051049460.23787@xanadu.home>
	 <s5hhc8u8soi.wl%tiwai@suse.de>
	 <alpine.LFD.1.10.0809051231120.23787@xanadu.home>
	 <s5hprniv7ep.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ik-out-1112.google.com ([66.249.90.178]:59043 "EHLO
	ik-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871AbYIESdV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Sep 2008 14:33:21 -0400
Received: by ik-out-1112.google.com with SMTP id c28so375813ika.5
        for <linux-next@vger.kernel.org>; Fri, 05 Sep 2008 11:33:19 -0700 (PDT)
In-Reply-To: <s5hprniv7ep.wl%tiwai@suse.de>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Nicolas Pitre <nico@cam.org>, Randy Dunlap <randy.dunlap@oracle.com>, lkml <linux-kernel@vger.kernel.org>, akpm <akpm@osdl.org>, linux-next@vger.kernel.org

On Fri, Sep 5, 2008 at 1:17 PM, Takashi Iwai <tiwai@suse.de> wrote:
> At Fri, 05 Sep 2008 12:32:32 -0400 (EDT),
> Nicolas Pitre wrote:
>>
>> On Fri, 5 Sep 2008, Takashi Iwai wrote:
>>
>> > At Fri, 05 Sep 2008 10:52:25 -0400 (EDT),
>> > Nicolas Pitre wrote:
>> > >
>> > > On Fri, 5 Sep 2008, Takashi Iwai wrote:
>> > >
>> > > > > This was fixed 2 years ago.  Who broke it this time?
>> > > >
>> > > > Oh, it must be me.
>> > >
>> > > I think both your patch and the one I previously posted are needed.
>> >
>> > Could you repost?  I can't find it easily now.
>
> Thanks.  For linux-next, yes, it's needed.  But it's not for 2.6.27.
>
> Meanwhile, my fix should be included in 2.6.27 since it's a
> regression.
>
> Randy, could you check whether these two patches fix your problem?
> I'll put my patch to my tree for the next pull request after your
> confirmation.
>
> Can Nicolas's patch be to input tree, or any other taker?
>

I'll take it.

-- 
Dmitry
