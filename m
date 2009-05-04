From: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: next: build fails at fs/lockd/svclock.c
Date: Mon, 4 May 2009 17:23:26 +0400
Message-ID: <a4423d670905040623q48eb552ft3bd107d6aa71d63b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Blyakher <felixb-sJ/iWh9BUns@public.gmane.org>, "J. Bruce Fields" <bfields-vtMw8L3fJ9vSiEDVxGk4TQ@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

Hi

Randconfig fails like this

fs/lockd/svclock.c: In function 'nlmsvc_freegrantargs':
fs/lockd/svclock.c:330: error: implicit declaration of function
'locks_release_private'

caused by a9e61e25f9d2
(lockd: call locks_release_private to cleanup per-filesystem state)


# CONFIG_FILE_LOCKING is not set
CONFIG_LOCKD=y
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
