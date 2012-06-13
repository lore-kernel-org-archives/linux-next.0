From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: build failure after merge of the final tree (pci tree related)
Date: Wed, 13 Jun 2012 17:20:46 -0600
Message-ID: <CAErSpo5Lrk3=hgSd2j+OMLN7rS8kCo5Qr=bPCnDZQdyb=EbEzA@mail.gmail.com>
References: <20120612145441.400975347f06785d391d0f8f@canb.auug.org.au>
 <CAErSpo6LxpYz_WK2mHPW3RWkOMPLar0KUp1Pgh7shhOdmT49kw@mail.gmail.com> <20120613105041.2d5dcdde6b9cf3dcfba3885d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:58713 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754826Ab2FMXVK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Jun 2012 19:21:10 -0400
Received: by yhmm54 with SMTP id m54so1055225yhm.19
        for <linux-next@vger.kernel.org>; Wed, 13 Jun 2012 16:21:07 -0700 (PDT)
In-Reply-To: <20120613105041.2d5dcdde6b9cf3dcfba3885d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org

On Tue, Jun 12, 2012 at 6:50 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Bjorn,
>
> On Tue, 12 Jun 2012 09:31:49 -0600 Bjorn Helgaas <bhelgaas@google.com=
> wrote:
>>
>> Thanks, I folded this typo fix into the relevant patch. =A0I'll reba=
se
>> "next" today. =A0Sorry for the trouble.
>
> I am not sure what you have done, but now you have a set of duplicate=
d
> commits in your tree including both versions of the one that caused t=
he
> build failure.

This is because of my inept git usage.  I think my "next" branch ended
up with the right bits in it, but the history looked strange because I
fixed the typo in the Yinghai branch, but had a second branch that
depended on the original unfixed branch.

I rebuilt my "next" branch again and I think it's more
straightforward.  And I learned a tiny bit more about git, so thanks
for pointing this out.

Bjorn
