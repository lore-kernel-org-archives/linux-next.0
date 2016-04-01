From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current tree
Date: Thu, 31 Mar 2016 17:23:27 -0700
Message-ID: <CAKU3ayUnachD60Q1HwfMAXTOThwH1cF55t2yBwAVVzYoM4QE-Q@mail.gmail.com>
References: <20160208131629.20a16097@canb.auug.org.au>
	<20160208022152.GA21591@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:33563 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750720AbcDAAX2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Mar 2016 20:23:28 -0400
Received: by mail-qg0-f52.google.com with SMTP id j35so82392825qge.0
        for <linux-next@vger.kernel.org>; Thu, 31 Mar 2016 17:23:28 -0700 (PDT)
In-Reply-To: <20160208022152.GA21591@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>

On Sun, Feb 7, 2016 at 6:21 PM, Greg KH <greg@kroah.com> wrote:
> On Mon, Feb 08, 2016 at 01:16:29PM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> Today's linux-next merge of the tty tree got a conflict in:
>>
>>   drivers/tty/tty_io.c
>>
>> between commit:
>>
>>   e9036d066236 ("tty: Drop krefs for interrupted tty lock")
>>
>> from the tty.current tree and commit:
>>
>>   d6203d0c7b73 ("tty: Refactor tty_open()")
>>
>> from the tty tree.
>>
>> I fixed it up (I think - see below) and can carry the fix as necessary
>> (no action is required).
>>
>> --
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc drivers/tty/tty_io.c
>> index a7eacef1bd22,8d26ed79bb4c..000000000000
>> --- a/drivers/tty/tty_io.c
>> +++ b/drivers/tty/tty_io.c
>> @@@ -2004,6 -2009,69 +2009,68 @@@ static struct tty_driver *tty_lookup_dr
>>   }
>>
>>   /**
>> +  *  tty_open_by_driver      -       open a tty device
>> +  *  @device: dev_t of device to open
>> +  *  @inode: inode of device file
>> +  *  @filp: file pointer to tty
>> +  *
>> +  *  Performs the driver lookup, checks for a reopen, or otherwise
>> +  *  performs the first-time tty initialization.
>> +  *
>> +  *  Returns the locked initialized or re-opened &tty_struct
>> +  *
>> +  *  Claims the global tty_mutex to serialize:
>> +  *    - concurrent first-time tty initialization
>> +  *    - concurrent tty driver removal w/ lookup
>> +  *    - concurrent tty removal from driver table
>> +  */
>> + static struct tty_struct *tty_open_by_driver(dev_t device, struct inode *inode,
>> +                                          struct file *filp)
>> + {
>> +     struct tty_struct *tty;
>> +     struct tty_driver *driver = NULL;
>> +     int index = -1;
>> +     int retval;
>> +
>> +     mutex_lock(&tty_mutex);
>> +     driver = tty_lookup_driver(device, filp, &index);
>> +     if (IS_ERR(driver)) {
>> +             mutex_unlock(&tty_mutex);
>> +             return ERR_CAST(driver);
>> +     }
>> +
>> +     /* check whether we're reopening an existing tty */
>> +     tty = tty_driver_lookup_tty(driver, inode, index);
>> +     if (IS_ERR(tty)) {
>> +             mutex_unlock(&tty_mutex);
>> +             goto out;
>> +     }
>> +
>> +     if (tty) {
>> +             mutex_unlock(&tty_mutex);
>> +             retval = tty_lock_interruptible(tty);
>> ++            tty_kref_put(tty);  /* drop kref from tty_driver_lookup_tty() */
>> +             if (retval) {
>> +                     if (retval == -EINTR)
>> +                             retval = -ERESTARTSYS;
>> +                     tty = ERR_PTR(retval);
>> +                     goto out;
>> +             }
>>  -            /* safe to drop the kref from tty_driver_lookup_tty() */
>>  -            tty_kref_put(tty);
>> +             retval = tty_reopen(tty);
>> +             if (retval < 0) {
>> +                     tty_unlock(tty);
>> +                     tty = ERR_PTR(retval);
>> +             }
>> +     } else { /* Returns with the tty_lock held for now */
>> +             tty = tty_init_dev(driver, index);
>> +             mutex_unlock(&tty_mutex);
>> +     }
>> + out:
>> +     tty_driver_kref_put(driver);
>> +     return tty;
>> + }
>> +
>> + /**
>>    *  tty_open                -       open a tty device
>>    *  @inode: inode of device file
>>    *  @filp: file pointer to tty
>
> Peter warned me this was going to happen...
>
> Peter, is the merge above correct?

Greg, this merge correction did not make it into 4.6-rc1.

Was I supposed to send a separate patch for this merge change?
Should I now?

Regards,
Peter Hurley
