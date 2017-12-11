From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb-next tree with the vfs tree
Date: Mon, 11 Dec 2017 11:22:53 +1100
Message-ID: <20171211112253.3bfc2250@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35745 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751137AbdLKAWz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Dec 2017 19:22:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Young <sean@mess.org>

Hi Mauro,

Today's linux-next merge of the v4l-dvb-next tree got a conflict in:

  drivers/media/rc/lirc_dev.c

between commit:

  c23e0cb81e40 ("media: annotate ->poll() instances")

from the vfs tree and various commits from the v4l-dvb-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/media/rc/lirc_dev.c
index aab53641838b,218658917cf6..000000000000
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@@ -335,149 -459,337 +459,337 @@@ static long ir_lirc_ioctl(struct file *
  			break;
  		}
  
- 		result = get_user(mode, (__u32 __user *)arg);
- 		if (!result && !(LIRC_MODE2REC(mode) & d->features))
- 			result = -EINVAL;
- 		/*
- 		 * FIXME: We should actually set the mode somehow but
- 		 * for now, lirc_serial doesn't support mode changing either
- 		 */
+ 		if (!ret)
+ 			fh->rec_mode = val;
+ 		break;
+ 
+ 	case LIRC_GET_SEND_MODE:
+ 		if (!dev->tx_ir)
+ 			ret = -ENOTTY;
+ 		else
+ 			val = fh->send_mode;
+ 		break;
+ 
+ 	case LIRC_SET_SEND_MODE:
+ 		if (!dev->tx_ir)
+ 			ret = -ENOTTY;
+ 		else if (!(val == LIRC_MODE_PULSE || val == LIRC_MODE_SCANCODE))
+ 			ret = -EINVAL;
+ 		else
+ 			fh->send_mode = val;
+ 		break;
+ 
+ 	/* TX settings */
+ 	case LIRC_SET_TRANSMITTER_MASK:
+ 		if (!dev->s_tx_mask)
+ 			ret = -ENOTTY;
+ 		else
+ 			ret = dev->s_tx_mask(dev, val);
+ 		break;
+ 
+ 	case LIRC_SET_SEND_CARRIER:
+ 		if (!dev->s_tx_carrier)
+ 			ret = -ENOTTY;
+ 		else
+ 			ret = dev->s_tx_carrier(dev, val);
+ 		break;
+ 
+ 	case LIRC_SET_SEND_DUTY_CYCLE:
+ 		if (!dev->s_tx_duty_cycle)
+ 			ret = -ENOTTY;
+ 		else if (val <= 0 || val >= 100)
+ 			ret = -EINVAL;
+ 		else
+ 			ret = dev->s_tx_duty_cycle(dev, val);
+ 		break;
+ 
+ 	/* RX settings */
+ 	case LIRC_SET_REC_CARRIER:
+ 		if (!dev->s_rx_carrier_range)
+ 			ret = -ENOTTY;
+ 		else if (val <= 0)
+ 			ret = -EINVAL;
+ 		else
+ 			ret = dev->s_rx_carrier_range(dev, fh->carrier_low,
+ 						      val);
  		break;
- 	case LIRC_GET_LENGTH:
- 		result = put_user(d->code_length, (__u32 __user *)arg);
+ 
+ 	case LIRC_SET_REC_CARRIER_RANGE:
+ 		if (!dev->s_rx_carrier_range)
+ 			ret = -ENOTTY;
+ 		else if (val <= 0)
+ 			ret = -EINVAL;
+ 		else
+ 			fh->carrier_low = val;
+ 		break;
+ 
+ 	case LIRC_GET_REC_RESOLUTION:
+ 		if (!dev->rx_resolution)
+ 			ret = -ENOTTY;
+ 		else
+ 			val = dev->rx_resolution / 1000;
+ 		break;
+ 
+ 	case LIRC_SET_WIDEBAND_RECEIVER:
+ 		if (!dev->s_learning_mode)
+ 			ret = -ENOTTY;
+ 		else
+ 			ret = dev->s_learning_mode(dev, !!val);
+ 		break;
+ 
+ 	case LIRC_SET_MEASURE_CARRIER_MODE:
+ 		if (!dev->s_carrier_report)
+ 			ret = -ENOTTY;
+ 		else
+ 			ret = dev->s_carrier_report(dev, !!val);
+ 		break;
+ 
+ 	/* Generic timeout support */
+ 	case LIRC_GET_MIN_TIMEOUT:
+ 		if (!dev->max_timeout)
+ 			ret = -ENOTTY;
+ 		else
+ 			val = DIV_ROUND_UP(dev->min_timeout, 1000);
+ 		break;
+ 
+ 	case LIRC_GET_MAX_TIMEOUT:
+ 		if (!dev->max_timeout)
+ 			ret = -ENOTTY;
+ 		else
+ 			val = dev->max_timeout / 1000;
+ 		break;
+ 
+ 	case LIRC_SET_REC_TIMEOUT:
+ 		if (!dev->max_timeout) {
+ 			ret = -ENOTTY;
+ 		} else if (val > U32_MAX / 1000) {
+ 			/* Check for multiply overflow */
+ 			ret = -EINVAL;
+ 		} else {
+ 			u32 tmp = val * 1000;
+ 
+ 			if (tmp < dev->min_timeout || tmp > dev->max_timeout)
+ 				ret = -EINVAL;
+ 			else if (dev->s_timeout)
+ 				ret = dev->s_timeout(dev, tmp);
+ 			else if (!ret)
+ 				dev->timeout = tmp;
+ 		}
  		break;
+ 
+ 	case LIRC_SET_REC_TIMEOUT_REPORTS:
+ 		if (!dev->timeout)
+ 			ret = -ENOTTY;
+ 		else
+ 			fh->send_timeout_reports = !!val;
+ 		break;
+ 
  	default:
- 		result = -ENOTTY;
+ 		ret = -ENOTTY;
  	}
  
+ 	if (!ret && _IOC_DIR(cmd) & _IOC_READ)
+ 		ret = put_user(val, argp);
+ 
  out:
- 	mutex_unlock(&d->mutex);
- 	return result;
+ 	mutex_unlock(&dev->lock);
+ 	return ret;
  }
- EXPORT_SYMBOL(lirc_dev_fop_ioctl);
  
- ssize_t lirc_dev_fop_read(struct file *file,
- 			  char __user *buffer,
- 			  size_t length,
- 			  loff_t *ppos)
 -static unsigned int ir_lirc_poll(struct file *file,
++static __poll_t ir_lirc_poll(struct file *file,
+ 				 struct poll_table_struct *wait)
  {
- 	struct lirc_dev *d = file->private_data;
- 	unsigned char *buf;
- 	int ret, written = 0;
- 	DECLARE_WAITQUEUE(wait, current);
+ 	struct lirc_fh *fh = file->private_data;
+ 	struct rc_dev *rcdev = fh->rc;
 -	unsigned int events = 0;
++	__poll_t events = 0;
+ 
+ 	poll_wait(file, &fh->wait_poll, wait);
+ 
+ 	if (!rcdev->registered) {
+ 		events = POLLHUP | POLLERR;
+ 	} else if (rcdev->driver_type != RC_DRIVER_IR_RAW_TX) {
+ 		if (fh->rec_mode == LIRC_MODE_SCANCODE &&
+ 		    !kfifo_is_empty(&fh->scancodes))
+ 			events = POLLIN | POLLRDNORM;
+ 
+ 		if (fh->rec_mode == LIRC_MODE_MODE2 &&
+ 		    !kfifo_is_empty(&fh->rawir))
+ 			events = POLLIN | POLLRDNORM;
+ 	}
  
- 	buf = kzalloc(d->buf->chunk_size, GFP_KERNEL);
- 	if (!buf)
- 		return -ENOMEM;
+ 	return events;
+ }
  
- 	dev_dbg(&d->dev, LOGHEAD "read called\n", d->name, d->minor);
+ static ssize_t ir_lirc_read_mode2(struct file *file, char __user *buffer,
+ 				  size_t length)
+ {
+ 	struct lirc_fh *fh = file->private_data;
+ 	struct rc_dev *rcdev = fh->rc;
+ 	unsigned int copied;
+ 	int ret;
  
- 	ret = mutex_lock_interruptible(&d->mutex);
- 	if (ret) {
- 		kfree(buf);
- 		return ret;
- 	}
+ 	if (length < sizeof(unsigned int) || length % sizeof(unsigned int))
+ 		return -EINVAL;
  
- 	if (!d->attached) {
- 		ret = -ENODEV;
- 		goto out_locked;
- 	}
+ 	do {
+ 		if (kfifo_is_empty(&fh->rawir)) {
+ 			if (file->f_flags & O_NONBLOCK)
+ 				return -EAGAIN;
  
- 	if (!LIRC_CAN_REC(d->features)) {
- 		ret = -EINVAL;
- 		goto out_locked;
- 	}
+ 			ret = wait_event_interruptible(fh->wait_poll,
+ 					!kfifo_is_empty(&fh->rawir) ||
+ 					!rcdev->registered);
+ 			if (ret)
+ 				return ret;
+ 		}
  
- 	if (length % d->buf->chunk_size) {
- 		ret = -EINVAL;
- 		goto out_locked;
- 	}
+ 		if (!rcdev->registered)
+ 			return -ENODEV;
  
- 	/*
- 	 * we add ourselves to the task queue before buffer check
- 	 * to avoid losing scan code (in case when queue is awaken somewhere
- 	 * between while condition checking and scheduling)
- 	 */
- 	add_wait_queue(&d->buf->wait_poll, &wait);
- 
- 	/*
- 	 * while we didn't provide 'length' bytes, device is opened in blocking
- 	 * mode and 'copy_to_user' is happy, wait for data.
- 	 */
- 	while (written < length && ret == 0) {
- 		if (lirc_buffer_empty(d->buf)) {
- 			/* According to the read(2) man page, 'written' can be
- 			 * returned as less than 'length', instead of blocking
- 			 * again, returning -EWOULDBLOCK, or returning
- 			 * -ERESTARTSYS
- 			 */
- 			if (written)
- 				break;
- 			if (file->f_flags & O_NONBLOCK) {
- 				ret = -EWOULDBLOCK;
- 				break;
- 			}
- 			if (signal_pending(current)) {
- 				ret = -ERESTARTSYS;
- 				break;
- 			}
- 
- 			mutex_unlock(&d->mutex);
- 			set_current_state(TASK_INTERRUPTIBLE);
- 			schedule();
- 			set_current_state(TASK_RUNNING);
- 
- 			ret = mutex_lock_interruptible(&d->mutex);
- 			if (ret) {
- 				remove_wait_queue(&d->buf->wait_poll, &wait);
- 				goto out_unlocked;
- 			}
- 
- 			if (!d->attached) {
- 				ret = -ENODEV;
- 				goto out_locked;
- 			}
- 		} else {
- 			lirc_buffer_read(d->buf, buf);
- 			ret = copy_to_user((void __user *)buffer+written, buf,
- 					   d->buf->chunk_size);
- 			if (!ret)
- 				written += d->buf->chunk_size;
- 			else
- 				ret = -EFAULT;
+ 		ret = mutex_lock_interruptible(&rcdev->lock);
+ 		if (ret)
+ 			return ret;
+ 		ret = kfifo_to_user(&fh->rawir, buffer, length, &copied);
+ 		mutex_unlock(&rcdev->lock);
+ 		if (ret)
+ 			return ret;
+ 	} while (copied == 0);
+ 
+ 	return copied;
+ }
+ 
+ static ssize_t ir_lirc_read_scancode(struct file *file, char __user *buffer,
+ 				     size_t length)
+ {
+ 	struct lirc_fh *fh = file->private_data;
+ 	struct rc_dev *rcdev = fh->rc;
+ 	unsigned int copied;
+ 	int ret;
+ 
+ 	if (length < sizeof(struct lirc_scancode) ||
+ 	    length % sizeof(struct lirc_scancode))
+ 		return -EINVAL;
+ 
+ 	do {
+ 		if (kfifo_is_empty(&fh->scancodes)) {
+ 			if (file->f_flags & O_NONBLOCK)
+ 				return -EAGAIN;
+ 
+ 			ret = wait_event_interruptible(fh->wait_poll,
+ 					!kfifo_is_empty(&fh->scancodes) ||
+ 					!rcdev->registered);
+ 			if (ret)
+ 				return ret;
  		}
- 	}
  
- 	remove_wait_queue(&d->buf->wait_poll, &wait);
+ 		if (!rcdev->registered)
+ 			return -ENODEV;
+ 
+ 		ret = mutex_lock_interruptible(&rcdev->lock);
+ 		if (ret)
+ 			return ret;
+ 		ret = kfifo_to_user(&fh->scancodes, buffer, length, &copied);
+ 		mutex_unlock(&rcdev->lock);
+ 		if (ret)
+ 			return ret;
+ 	} while (copied == 0);
+ 
+ 	return copied;
+ }
+ 
+ static ssize_t ir_lirc_read(struct file *file, char __user *buffer,
+ 			    size_t length, loff_t *ppos)
+ {
+ 	struct lirc_fh *fh = file->private_data;
+ 	struct rc_dev *rcdev = fh->rc;
  
- out_locked:
- 	mutex_unlock(&d->mutex);
+ 	if (rcdev->driver_type == RC_DRIVER_IR_RAW_TX)
+ 		return -EINVAL;
  
- out_unlocked:
- 	kfree(buf);
+ 	if (!rcdev->registered)
+ 		return -ENODEV;
  
- 	return ret ? ret : written;
+ 	if (fh->rec_mode == LIRC_MODE_MODE2)
+ 		return ir_lirc_read_mode2(file, buffer, length);
+ 	else /* LIRC_MODE_SCANCODE */
+ 		return ir_lirc_read_scancode(file, buffer, length);
  }
- EXPORT_SYMBOL(lirc_dev_fop_read);
  
- void lirc_init_pdata(struct inode *inode, struct file *file)
+ static const struct file_operations lirc_fops = {
+ 	.owner		= THIS_MODULE,
+ 	.write		= ir_lirc_transmit_ir,
+ 	.unlocked_ioctl	= ir_lirc_ioctl,
+ #ifdef CONFIG_COMPAT
+ 	.compat_ioctl	= ir_lirc_ioctl,
+ #endif
+ 	.read		= ir_lirc_read,
+ 	.poll		= ir_lirc_poll,
+ 	.open		= ir_lirc_open,
+ 	.release	= ir_lirc_close,
+ 	.llseek		= no_llseek,
+ };
+ 
+ static void lirc_release_device(struct device *ld)
  {
- 	struct lirc_dev *d = container_of(inode->i_cdev, struct lirc_dev, cdev);
+ 	struct rc_dev *rcdev = container_of(ld, struct rc_dev, lirc_dev);
  
- 	file->private_data = d;
+ 	put_device(&rcdev->dev);
  }
- EXPORT_SYMBOL(lirc_init_pdata);
  
- void *lirc_get_pdata(struct file *file)
+ int ir_lirc_register(struct rc_dev *dev)
  {
- 	struct lirc_dev *d = file->private_data;
+ 	int err, minor;
+ 
+ 	minor = ida_simple_get(&lirc_ida, 0, RC_DEV_MAX, GFP_KERNEL);
+ 	if (minor < 0)
+ 		return minor;
+ 
+ 	device_initialize(&dev->lirc_dev);
+ 	dev->lirc_dev.class = lirc_class;
+ 	dev->lirc_dev.parent = &dev->dev;
+ 	dev->lirc_dev.release = lirc_release_device;
+ 	dev->lirc_dev.devt = MKDEV(MAJOR(lirc_base_dev), minor);
+ 	dev_set_name(&dev->lirc_dev, "lirc%d", minor);
  
- 	return d->data;
+ 	INIT_LIST_HEAD(&dev->lirc_fh);
+ 	spin_lock_init(&dev->lirc_fh_lock);
+ 
+ 	cdev_init(&dev->lirc_cdev, &lirc_fops);
+ 
+ 	err = cdev_device_add(&dev->lirc_cdev, &dev->lirc_dev);
+ 	if (err)
+ 		goto out_ida;
+ 
+ 	get_device(&dev->dev);
+ 
+ 	dev_info(&dev->dev, "lirc_dev: driver %s registered at minor = %d",
+ 		 dev->driver_name, minor);
+ 
+ 	return 0;
+ 
+ out_ida:
+ 	ida_simple_remove(&lirc_ida, minor);
+ 	return err;
  }
- EXPORT_SYMBOL(lirc_get_pdata);
  
+ void ir_lirc_unregister(struct rc_dev *dev)
+ {
+ 	unsigned long flags;
+ 	struct lirc_fh *fh;
+ 
+ 	dev_dbg(&dev->dev, "lirc_dev: driver %s unregistered from minor = %d\n",
+ 		dev->driver_name, MINOR(dev->lirc_dev.devt));
  
- static int __init lirc_dev_init(void)
+ 	spin_lock_irqsave(&dev->lirc_fh_lock, flags);
+ 	list_for_each_entry(fh, &dev->lirc_fh, list)
+ 		wake_up_poll(&fh->wait_poll, POLLHUP | POLLERR);
+ 	spin_unlock_irqrestore(&dev->lirc_fh_lock, flags);
+ 
+ 	cdev_device_del(&dev->lirc_cdev, &dev->lirc_dev);
+ 	ida_simple_remove(&lirc_ida, MINOR(dev->lirc_dev.devt));
+ }
+ 
+ int __init lirc_dev_init(void)
  {
  	int retval;
  
