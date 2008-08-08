From: "Steve French" <smfrench@gmail.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 8 Aug 2008 10:25:03 -0500
Message-ID: <524f69650808080825y2cfdf6aapfa1ed1dff20aea08@mail.gmail.com>
References: <20080808160143.bd1c7ea3.sfr@canb.auug.org.au>
	 <20080808160303.224eb000.sfr@canb.auug.org.au>
	 <20080808074111.6ccfc4fd@tleilax.poochiereds.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.171]:46538 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755788AbYHHPZE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Aug 2008 11:25:04 -0400
Received: by wf-out-1314.google.com with SMTP id 27so1737525wfd.4
        for <linux-next@vger.kernel.org>; Fri, 08 Aug 2008 08:25:03 -0700 (PDT)
In-Reply-To: <20080808074111.6ccfc4fd@tleilax.poochiereds.net>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Layton <jlayton@redhat.com>, Shirish Pargaonkar <shirishpargaonkar@gmail.com>
Cc: linux-next@vger.kernel.org, linux-cifs-client@lists.samba.org

On Fri, Aug 8, 2008 at 6:41 AM, Jeff Layton <jlayton@redhat.com> wrote:
> On Fri, 8 Aug 2008 16:03:03 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Hi David,
>>
>> On Fri, 8 Aug 2008 16:01:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > Today's linux-next merge of the creds tree got conflicts in fs/cifs/dir.c
>> > between commits 4e1e7fb9e879d48011a887715d7966484d9644ea ("bundle up Unix
>> > SET_PATH_INFO args into a struct and change name") and
>> > 95089910933e10768cfef1ab0bab0c55b962aacb ("[CIFS] cifs_mkdir and
>> > cifs_create should respect the setgid bit on parent dir") from the cifs
>> > tree and commit 785af0f385cd424d4b40908bf0e467df3dc05434 ("CRED: Change
>> > current->fs[ug]id to current_fs[ug]id()") from the creds tree.
FYI - am waiting on more test feedback from the usual cifs community
before pushing those
cifs-2.6.git changes up to mainline.    In my testing of the current
cifs-2.6 tree,
there are a couple things I noticed in testing against various Samba
versions, but it looks like
they were Samba problems that have been fixed (still investigating).
I am particularly
interested in attribute, size, time stamp related testing against non-Windows,
non-current-Samba servers ...


-- 
Thanks,

Steve
