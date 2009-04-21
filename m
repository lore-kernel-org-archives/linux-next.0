From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH 1/2] fs/compat_ioctl: fix build when !BLOCK
Date: Tue, 21 Apr 2009 12:34:36 +0400
Message-ID: <a4423d670904210134i2aa1b6b9xf9d38792b7302044@mail.gmail.com>
References: <1240215264-8096-1-git-send-email-a.beregalov@gmail.com>
	 <20090421073234.GB4593@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755054AbZDUIeu@vger.kernel.org>
In-Reply-To: <20090421073234.GB4593@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
List-Id: linux-next.vger.kernel.org

2009/4/21 Jens Axboe <jens.axboe@oracle.com>:
> On Mon, Apr 20 2009, Alexander Beregalov wrote:
>> From: alexb <alexb@localhost.(none)>
>>
>> In file included from fs/compat_ioctl.c:61:
>> include/linux/loop.h:59: error: field 'lo_bio_list' has incomplete type
>>
>> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
>
> Thanks, applied.

Hi Jens

Al has already sent it to Linus.
